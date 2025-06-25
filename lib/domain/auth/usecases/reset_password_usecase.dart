part of '../index.dart';

class ResetPasswordUseCase extends UseCase<Either, String> {
  @override
  Future<Either> call({String? params}) {
    return getIt<AuthRepository>().resetPassword(params!);
  }
}
