part of '../index.dart';

class IsLoggedInUseCase extends UseCase<bool, dynamic> {
  @override
  Future<bool> call({params}) async {
    return await getIt<AuthRepository>().isLoggedIn();
  }
}
