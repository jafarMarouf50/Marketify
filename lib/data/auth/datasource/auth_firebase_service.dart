part of '../index.dart';

abstract class AuthFirebaseService {
  Future<Either> signup(CreateUserRequest request);
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
      }
      return Left(message);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
