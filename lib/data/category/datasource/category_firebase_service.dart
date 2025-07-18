part of '../index.dart';

abstract class CategoryFirebaseService {
  Future<Either> addCategory(StoreCategoryRequest request);
}

class CategoryFirebaseServiceImpl extends CategoryFirebaseService {
  @override
  Future<Either> addCategory(StoreCategoryRequest request) async {
    try {
      final String imageUrl = await SupabaseUploader.uploadFile(
        request.imageUrl,
        'categories',
      );

      final CollectionReference category = FirebaseFirestore.instance
          .collection("categories");
      category.add({'title': request.title, 'imageUrl': imageUrl});

      return Right("Category Stored Successfully");
    } on StorageException catch (e) {
      return Left("Supabase Storage Error: ${e.message}");
    } on FirebaseException catch (e) {
      return Left("Firebase Exception with message: ${e.message}");
    } catch (e) {
      return Left(e.toString());
    }
  }
}
