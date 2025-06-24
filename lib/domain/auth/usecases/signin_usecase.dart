part of '../index.dart';

class SigninUseCase extends UseCase<Either, LoginUserRequest> {
  @override
  Future<Either> call({LoginUserRequest? params}) {
    return getIt<AuthRepository>().signin(params!);
  }
}
