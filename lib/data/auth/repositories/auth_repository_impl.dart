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
  Future<String> isLoggedIn() async {
    return getIt<AuthLocalService>().isLoggedIn() != ''
        ? getIt<AuthLocalService>().isLoggedIn()
        : await getIt<AuthFirebaseService>().isLoggedIn();
  }

  @override
  Future<Either> getCurrentUser() async {
    try {
      final localUser = getIt<AuthLocalService>().getUser();

      if (localUser != null) {
        return Right(localUser);
      }

      final remoteResult = await getIt<AuthFirebaseService>().getUser();

      return remoteResult.fold((error) => Left(error), (user) => Right(user));
    } catch (e) {
      return Left("Error getting current user: ${e.toString()}");
    }
  }

  @override
  Future<Either> signOut() async {
    return await getIt<AuthFirebaseService>().signOut();
  }
}
