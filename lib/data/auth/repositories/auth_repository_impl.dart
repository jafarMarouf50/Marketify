part of '../index.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(CreateUserRequest request) async {
    return await getIt<AuthFirebaseService>().signup(request);
  }

  @override
  Future<Either> signin(LoginUserRequest request) async {
    return await getIt<AuthFirebaseService>().signin(request);
  }

  @override
  Future<Either> getAges() async {
    return await getIt<AuthFirebaseService>().getAges();
  }

  @override
  Future<Either> resetPassword(String email) async {
    return await getIt<AuthFirebaseService>().resetPassword(email);
  }

  @override
  Future<bool> isLoggedIn() async {
    return getIt<AuthFirebaseService>().isLoggedIn();
  }
}
