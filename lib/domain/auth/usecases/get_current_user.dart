part of '../index.dart';

class GetCurrentUserUseCase extends UseCase<Either,dynamic>{
  @override
  Future<Either> call({params}) async{
    return await getIt<AuthRepository>().getCurrentUser();
  }

}