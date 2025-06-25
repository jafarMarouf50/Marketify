part of '../index.dart';

class SigninUseCase extends UseCase<Either, LoginUserRequest> {
  @override
  Future<Either> call({LoginUserRequest? params}) async{
    return await getIt<AuthRepository>().signin(params!);
  }
}
