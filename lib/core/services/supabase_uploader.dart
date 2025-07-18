part of '../index.dart';

class SupabaseUploader {
  static final SupabaseClient _supabase = Supabase.instance.client;

  static Future<String> uploadFile(File file, String bucketName) async {
    try {
      final String fileName = file.path.split('/').last;
      final filePath = 'public/$fileName';
      await _supabase.storage
          .from(bucketName)
          .upload(filePath, file, fileOptions: FileOptions(upsert: true));

      final signedUrl = await _supabase.storage
          .from(bucketName)
          .createSignedUrl(filePath, 3600);
      return signedUrl;
    }

    on StorageException catch (e) {
      log("StorageException: ${e.message}");
      throw Exception("Failed to upload file: ${e.message}");
    } catch (e) {
      log("Unknown error: $e");
      throw Exception("Unexpected error during upload: $e");
    }
  }
}
