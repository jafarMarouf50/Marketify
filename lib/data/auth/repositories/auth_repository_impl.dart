part of '../index.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signup(CreateUserRequest request) {
    return getIt<AuthFirebaseService>().signup(request);
  }
}
