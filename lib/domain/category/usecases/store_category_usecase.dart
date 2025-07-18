part of '../index.dart';

class StoreCategoryUseCase extends UseCase<Either, StoreCategoryRequest> {
  @override
  Future<Either> call({StoreCategoryRequest? params}) async {
    return await getIt<CategoryRepository>().addCategory(params!);
  }
}
