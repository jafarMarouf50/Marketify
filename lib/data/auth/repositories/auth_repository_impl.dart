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
    if (getIt<AuthLocalService>().isLoggedIn() != '') {
      return getIt<AuthLocalService>().isLoggedIn();
    }
    return await getIt<AuthFirebaseService>().isLoggedIn();
  }

  @override
  Future<Either> getCurrentUser() async {
    var data = await getIt<AuthFirebaseService>().getUser();
    return data.fold(
      (error) {
        return Left(error);
      },
      (user) {
        return Right(UserModel.fromMap(user).toEntity());
      },
    );
  }

  @override
  Future<Either> signOut() async {
    return await getIt<AuthFirebaseService>().signOut();
  }
}
