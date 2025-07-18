part of '../index.dart';

class SignoutUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await getIt<AuthRepository>().signOut();
  }
}
