part of '../index.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserRequest request);

  Future<Either> signin(LoginUserRequest request);

  Future<Either> getAges();
}
