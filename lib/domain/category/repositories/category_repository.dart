part of '../index.dart';

abstract class CategoryRepository {
  Future<Either> addCategory(StoreCategoryRequest request);
}
