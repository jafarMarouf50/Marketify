part of '../../index.dart';

Future<void> clearAllLocalData() async {
  try {
    if (Hive.isBoxOpen(AppConstants.kUserBox)) {
      final userBox = Hive.box<UserEntity>(AppConstants.kUserBox);
      await userBox.clear();
    }
    if (Hive.isBoxOpen(AppConstants.kPrefsBox)) {
      final prefsBox = Hive.box(AppConstants.kPrefsBox);
      await prefsBox.clear();
    }
  } on HiveError catch (e) {
    throw StorageException('Hive error while clearing data: ${e.message}');
  } catch (e) {
    throw StorageException('Unexpected error while clearing local data: $e');
  }
}
