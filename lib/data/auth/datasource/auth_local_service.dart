part of '../index.dart';

abstract class AuthLocalService {
  String isLoggedIn();

  UserEntity? getUser();
}

class AuthLocalServiceImpl extends AuthLocalService {
  static const String _lastUpdatedKey = 'user_last_updated';
  static const int _cacheExpirationHours = 24;

  @override
  UserEntity? getUser() {
    try {
      var box = Hive.box<UserEntity>(AppConstants.kUserBox);
      if (box.values.isEmpty) return null;

      // Check if cache is still valid
      if (isCacheExpired(_lastUpdatedKey, _cacheExpirationHours)) {
        return null;
      }
      return box.values.first;
    } catch (e) {
      return null;
    }
  }

  @override
  String isLoggedIn() {
    var box = Hive.box<UserEntity>(AppConstants.kUserBox);
    if (box.values.isEmpty) {
      return '';
    }
    return box.values.first.role;
  }
}
