part of '../index.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserRequest request);

  Future<Either> signin(LoginUserRequest request);

  Future<Either> getAges();

  Future<Either> resetPassword(String email);

  Future<bool> isLoggedIn();

  Future<Either> getUser();

  Future<Either> signOut();
}

class AuthFirebaseServiceImp extends AuthFirebaseService {
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
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: request.email!,
        password: request.password!,
      );
      return Right("Sign in Successfully!");
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
  Future<bool> isLoggedIn() async {
    if (FirebaseAuth.instance.currentUser == null) {
      return false;
    } else {
      return true;
    }
  }

  @override
  Future<Either> getUser() async {
    try {
      var authUser = FirebaseAuth.instance.currentUser;
      var currentUserData = await FirebaseFirestore.instance
          .collection("users")
          .doc(authUser?.uid)
          .get()
          .then((value) => value.data());
      return Right(currentUserData);
    } on FirebaseAuthException catch (e) {
      return Left("Failed with error code: ${e.code}");
    } catch (e) {
      return Left("Something was wrong!, ${e.toString()}");
    }
  }

  @override
  Future<Either> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      return Right("Sign out Successfully!");
    } on FirebaseAuthException catch (e) {
      return Left("Failed with error code: ${e.code}");
    } catch (e) {
      return Left("Something was wrong!, ${e.toString()}");
    }
  }
}
