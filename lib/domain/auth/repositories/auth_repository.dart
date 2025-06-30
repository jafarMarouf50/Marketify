part of '../index.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserRequest request);

  Future<Either> signin(LoginUserRequest request);

  Future<Either> getAges();

  Future<Either> resetPassword(String email);

  Future<String> isLoggedIn();

  Future<Either> getCurrentUser();

  Future<Either> signOut();
}
