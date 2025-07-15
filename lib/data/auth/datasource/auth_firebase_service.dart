part of '../index.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserRequest request);

  Future<Either> signin(LoginUserRequest request);

  Future<Either> getAges();

  Future<Either> resetPassword(String email);

  Future<String> isLoggedIn();

  Future<Either> getUser();

  Future<Either> signOut();
}

class AuthFirebaseServiceImp extends AuthFirebaseService {
  static const String _lastUpdatedKey = 'user_last_updated';

  @override
  Future<Either> signup(CreateUserRequest request) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: request.email!,
            password: request.password!,
          );
      final CollectionReference users = FirebaseFirestore.instance.collection(
        'users',
      );
      await users.doc(credential.user!.uid).set({
        'firstName': request.firstName,
        'lastName': request.lastName,
        'email': request.email,
        'gender': request.gender,
        'age': request.age,
        'role': request.role,
      });
      return Right("Account User created Successfully!");
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        message = 'The account already exists for that email.';
      } else {
        message = e.code;
      }
      return Left(message);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> signin(LoginUserRequest request) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: request.email!,
            password: request.password!,
          );
      var userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .get();
      return Right(userDoc['role']);
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'bloc-not-found') {
        message = 'No bloc found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that bloc.';
      } else {
        message = e.code;
      }
      return Left(message);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> getAges() async {
    try {
      var data = await FirebaseFirestore.instance.collection("Ages").get();
      return Right(data.docs);
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'bloc-not-found') {
        message = 'No bloc found for that email.';
      } else if (e.code == 'wrong-password') {
        message = 'Wrong password provided for that bloc.';
      } else {
        message = e.code;
      }
      return Left(message);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either> resetPassword(String email) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      return Right("Send Password Reset Email Successfully!");
    } on FirebaseAuthException catch (e) {
      return Left("Failed with error code: ${e.code}");
    }
  }

  @override
  Future<String> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser == null) {
      return '';
    }
    String uuid = FirebaseAuth.instance.currentUser!.uid;
    var data = await FirebaseFirestore.instance
        .collection('users')
        .doc(uuid)
        .get()
        .then((value) => value.data());
    var userEntity = UserModel.fromMap(data!).toEntity();
    LocalStorageService.saveData(userEntity, AppConstants.kUserBox, _lastUpdatedKey);
    return userEntity.role;
  }

  @override
  Future<Either> getUser() async {
    try {
      var authUser = FirebaseAuth.instance.currentUser;
      if (authUser == null) {
        return const Left("No authenticated user found");
      }
      var currentUserData = await FirebaseFirestore.instance
          .collection("users")
          .doc(authUser.uid)
          .get()
          .then((value) => value.data());
      if (currentUserData == null) {
        return const Left("User data not found in Firestore");
      }
      var userEntity = UserModel.fromMap(currentUserData).toEntity();
      LocalStorageService.saveData(userEntity, AppConstants.kUserBox, _lastUpdatedKey);
      return Right(userEntity);
    } on FirebaseAuthException catch (e) {
      return Left("Firebase Auth error: ${e.code} - ${e.message}");
    } catch (e) {
      return Left("Failed to fetch user: ${e.toString()}");
    }
  }

  @override
  Future<Either> signOut() async {
    try {
      await LocalStorageService.clearAllLocalData();
      await FirebaseAuth.instance.signOut();
      return Right("Sign out Successfully!");
    } on FirebaseAuthException catch (e) {
      return Left("Error during sign out: ${e.code}");
    } catch (e) {
      return Left("Something was wrong!, ${e.toString()}");
    }
  }
}
