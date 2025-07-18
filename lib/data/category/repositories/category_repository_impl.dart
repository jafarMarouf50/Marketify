part of '../index.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  @override
  Future<Either> addCategory(StoreCategoryRequest request) async {
    return await getIt<CategoryFirebaseService>().addCategory(request);
  }
}
