part of '../../index.dart';

class LocalStorageService {
  static final LocalStorageService _instance = LocalStorageService._internal();

  factory LocalStorageService() => _instance;

  LocalStorageService._internal();

  /// Check if cached data has expired
  static bool isCacheExpired(String lastUpdatedKey, int cacheExpirationHours) {
    try {
      final prefsBox = Hive.box(AppConstants.kPrefsBox);
      final lastUpdated = prefsBox.get(lastUpdatedKey, defaultValue: 0) as int;

      if (lastUpdated == 0) return true;

      final lastUpdatedDate = DateTime.fromMillisecondsSinceEpoch(lastUpdated);
      final now = DateTime.now();
      final difference = now.difference(lastUpdatedDate).inHours;

      return difference >= cacheExpirationHours;
    } catch (e) {
      return true;
    }
  }

  /// Clear all local data from Hive boxes
  static Future<void> clearAllLocalData() async {
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

  /// Save data to Hive box with timestamp
  static Future<void> saveData<T>(
    T items,
    String boxName,
    String lastUpdatedKey,
  ) async {
    try {
      final box = Hive.box<T>(boxName);
      await box.clear();
      await box.add(items);

      // Save timestamp
      final prefsBox = Hive.box(AppConstants.kPrefsBox);
      await prefsBox.put(lastUpdatedKey, DateTime.now().millisecondsSinceEpoch);
    } on HiveError catch (e) {
      throw StorageException('Hive error while saving data: ${e.message}');
    } catch (e) {
      throw StorageException('Unexpected error while saving data: $e');
    }
  }

  /// Save multiple items to Hive box
  Future<void> saveMultipleData<T>(
    List<T> items,
    String boxName,
    String lastUpdatedKey,
  ) async {
    try {
      final box = Hive.box<T>(boxName);
      await box.clear();
      await box.addAll(items);

      // Save timestamp
      final prefsBox = Hive.box(AppConstants.kPrefsBox);
      await prefsBox.put(lastUpdatedKey, DateTime.now().millisecondsSinceEpoch);
    } on HiveError catch (e) {
      throw StorageException(
        'Hive error while saving multiple data: ${e.message}',
      );
    } catch (e) {
      throw StorageException('Unexpected error while saving multiple data: $e');
    }
  }

  /// Get data from Hive box
  T? getData<T>(String boxName, {dynamic key, T? defaultValue}) {
    try {
      final box = Hive.box<T>(boxName);
      if (key != null) {
        return box.get(key, defaultValue: defaultValue);
      } else {
        return box.values.isNotEmpty ? box.values.first : defaultValue;
      }
    } on HiveError catch (e) {
      throw StorageException('Hive error while getting data: ${e.message}');
    } catch (e) {
      throw StorageException('Unexpected error while getting data: $e');
    }
  }

  /// Get all data from Hive box
  List<T> getAllData<T>(String boxName) {
    try {
      final box = Hive.box<T>(boxName);
      return box.values.toList();
    } on HiveError catch (e) {
      throw StorageException('Hive error while getting all data: ${e.message}');
    } catch (e) {
      throw StorageException('Unexpected error while getting all data: $e');
    }
  }

  /// Update existing data in Hive box
  Future<void> updateData<T>(
    String boxName,
    dynamic key,
    T value,
    String lastUpdatedKey,
  ) async {
    try {
      final box = Hive.box<T>(boxName);
      await box.put(key, value);

      // Update timestamp
      final prefsBox = Hive.box(AppConstants.kPrefsBox);
      await prefsBox.put(lastUpdatedKey, DateTime.now().millisecondsSinceEpoch);
    } on HiveError catch (e) {
      throw StorageException('Hive error while updating data: ${e.message}');
    } catch (e) {
      throw StorageException('Unexpected error while updating data: $e');
    }
  }

  /// Delete specific data from Hive box
  Future<void> deleteData<T>(
    String boxName,
    dynamic key,
    String lastUpdatedKey,
  ) async {
    try {
      final box = Hive.box<T>(boxName);
      await box.delete(key);

      // Update timestamp
      final prefsBox = Hive.box(AppConstants.kPrefsBox);
      await prefsBox.put(lastUpdatedKey, DateTime.now().millisecondsSinceEpoch);
    } on HiveError catch (e) {
      throw StorageException('Hive error while deleting data: ${e.message}');
    } catch (e) {
      throw StorageException('Unexpected error while deleting data: $e');
    }
  }

  /// Clear specific box
  Future<void> clearBox(String boxName) async {
    try {
      if (Hive.isBoxOpen(boxName)) {
        final box = Hive.box(boxName);
        await box.clear();
      }
    } on HiveError catch (e) {
      throw StorageException('Hive error while clearing box: ${e.message}');
    } catch (e) {
      throw StorageException('Unexpected error while clearing box: $e');
    }
  }

  /// Check if box exists and has data
  bool hasData(String boxName) {
    try {
      if (!Hive.isBoxOpen(boxName)) return false;
      final box = Hive.box(boxName);
      return box.isNotEmpty;
    } catch (e) {
      return false;
    }
  }

  /// Get cache timestamp
  DateTime? getCacheTimestamp(String lastUpdatedKey) {
    try {
      final prefsBox = Hive.box(AppConstants.kPrefsBox);
      final timestamp = prefsBox.get(lastUpdatedKey, defaultValue: 0) as int;

      if (timestamp == 0) return null;

      return DateTime.fromMillisecondsSinceEpoch(timestamp);
    } catch (e) {
      return null;
    }
  }

  /// Get cache age in hours
  int getCacheAgeInHours(String lastUpdatedKey) {
    try {
      final timestamp = getCacheTimestamp(lastUpdatedKey);
      if (timestamp == null) return -1;

      final now = DateTime.now();
      return now.difference(timestamp).inHours;
    } catch (e) {
      return -1;
    }
  }

  /// Set preference value
  Future<void> setPreference<T>(String key, T value) async {
    try {
      final prefsBox = Hive.box(AppConstants.kPrefsBox);
      await prefsBox.put(key, value);
    } on HiveError catch (e) {
      throw StorageException(
        'Hive error while setting preference: ${e.message}',
      );
    } catch (e) {
      throw StorageException('Unexpected error while setting preference: $e');
    }
  }

  /// Get preference value
  T? getPreference<T>(String key, {T? defaultValue}) {
    try {
      final prefsBox = Hive.box(AppConstants.kPrefsBox);
      return prefsBox.get(key, defaultValue: defaultValue) as T?;
    } on HiveError catch (e) {
      throw StorageException(
        'Hive error while getting preference: ${e.message}',
      );
    } catch (e) {
      throw StorageException('Unexpected error while getting preference: $e');
    }
  }

  /// Remove preference
  Future<void> removePreference(String key) async {
    try {
      final prefsBox = Hive.box(AppConstants.kPrefsBox);
      await prefsBox.delete(key);
    } on HiveError catch (e) {
      throw StorageException(
        'Hive error while removing preference: ${e.message}',
      );
    } catch (e) {
      throw StorageException('Unexpected error while removing preference: $e');
    }
  }
}

/// Extension methods for common operations
extension LocalStorageServiceExtensions on LocalStorageService {
  /// Check if user data exists and is not expired
  bool isUserDataValid(int cacheExpirationHours) {
    return hasData(AppConstants.kUserBox) &&
        !LocalStorageService.isCacheExpired(
          'user_last_updated',
          cacheExpirationHours,
        );
  }

  /// Save user data
  Future<void> saveUserData(UserEntity user) async {
    await LocalStorageService.saveData<UserEntity>(
      user,
      AppConstants.kUserBox,
      'user_last_updated',
    );
  }

  /// Get user data
  UserEntity? getUserData() {
    return getData<UserEntity>(AppConstants.kUserBox);
  }

  /// Clear only user data
  Future<void> clearUserData() async {
    await clearBox(AppConstants.kUserBox);
  }
}
