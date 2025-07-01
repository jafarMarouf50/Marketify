part of '../index.dart';

class HiveInitializer {
  static Future<void> initialize() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserEntityAdapter());

    await Future.wait([
      Hive.openBox<UserEntity>(AppConstants.kUserBox),
      Hive.openBox(AppConstants.kPrefsBox),
    ]);
  }
}
