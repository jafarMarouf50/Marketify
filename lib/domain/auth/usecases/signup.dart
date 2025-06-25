part of '../index.dart';

class SignupUseCase extends UseCase<Either, CreateUserRequest> {
  @override
  Future<Either> call({CreateUserRequest? params}) async {
    return await getIt<AuthRepository>().signup(params!);
  }
}
