part of '../index.dart';

abstract class AuthLocalService {
  String isLoggedIn();

  Either getUser();
}

class AuthLocalServiceImpl extends AuthLocalService {
  @override
  Either getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
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
