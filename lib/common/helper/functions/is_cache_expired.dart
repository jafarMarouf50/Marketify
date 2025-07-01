part of '../../index.dart';

bool isCacheExpired(String lastUpdatedKey, int cacheExpirationHours) {
  try {
    var prefsBox = Hive.box(AppConstants.kPrefsBox);
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
