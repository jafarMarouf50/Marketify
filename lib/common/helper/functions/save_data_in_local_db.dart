part of '../../index.dart';

void saveData<T>(T items, String boxName, String lastUpdatedKey) async {
  try {
    var box = Hive.box<T>(boxName);
    box.clear();
    await box.add(items);

    // Save timestamp
    var prefsBox = Hive.box(AppConstants.kPrefsBox);
    await prefsBox.put(lastUpdatedKey, DateTime.now().millisecondsSinceEpoch);
  } on HiveError catch (e) {
    throw StorageException('Hive error while saving data: ${e.message}');
  } catch (e) {
    throw StorageException('Unexpected error while saving data: $e');
  }
}
