part of '../index.dart';

class SignupState {
  final bool isPasswordVisible;
  final String? emailError;
  final String? passwordError;
  final String? firstNameError;
  final String? lastNameError;

  final bool isPasswordStrong;
  final PasswordStrength passwordStrength;

  SignupState({
    this.isPasswordVisible = false,
    this.emailError,
    this.passwordError,
    this.firstNameError,
    this.lastNameError,
    this.isPasswordStrong = false,
    this.passwordStrength = PasswordStrength.none,
  });

  SignupState copyWith({
    bool? isPasswordVisible,
    String? emailError,
    String? passwordError,
    String? firstNameError,
    String? lastNameError,
    bool? isPasswordStrong,
    PasswordStrength? passwordStrength,
  }) {
    return SignupState(
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      emailError: emailError,
      passwordError: passwordError,
      firstNameError: firstNameError,
      lastNameError: lastNameError,
      isPasswordStrong: isPasswordStrong ?? this.isPasswordStrong,
      passwordStrength: passwordStrength ?? this.passwordStrength,
    );
  }
}
