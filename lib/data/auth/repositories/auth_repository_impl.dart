part of '../index.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(CreateUserRequest request) {
    return getIt<AuthFirebaseService>().signup(request);
  }

  @override
  Future<Either> signin(LoginUserRequest request) {
    return getIt<AuthFirebaseService>().signin(request);
  }
}
