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

  @override
  Future<Either> getCurrentUser() async {
    var data = await getIt<AuthFirebaseService>().getUser();
    log("==========data:$data============================");
    return data.fold(
      (error) {
        return Left(error);
      },
      (user) {
        log("+++++++++++convert:${UserModel.fromMap(user).toEntity()}++++++++++++++++");
        return Right(UserModel.fromMap(user).toEntity());
      },
    );
  }
}
