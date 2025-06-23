part of '../index.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserRequest request);
}
