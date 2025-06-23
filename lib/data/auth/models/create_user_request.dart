part of '../index.dart';

class CreateUserRequest {
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? age;
  int? gender;

  CreateUserRequest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.gender,
    required this.age,
  });
}
