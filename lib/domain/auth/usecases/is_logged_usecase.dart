part of '../index.dart';

class IsLoggedInUseCase extends UseCase<String, dynamic> {
  @override
  Future<String> call({params}) async {
    return await getIt<AuthRepository>().isLoggedIn();
  }
}
