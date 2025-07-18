part of '../index.dart';

class ResetPasswordUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) async{
    return await getIt<AuthRepository>().resetPassword(params!);
  }
}
