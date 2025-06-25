part of '../index.dart';

class GetAgesUseCase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({dynamic params}) async {
    return await getIt<AuthRepository>().getAges();
  }
}
