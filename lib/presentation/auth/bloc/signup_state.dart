part of '../index.dart';

class SignupState {
  final AutovalidateMode autoValidateMode;
  final bool isPasswordVisible;
  final String? firstNameError;
  final String? lastNameError;
  final String? emailError;
  final String? passwordError;
  final PasswordStrength passwordStrength;

  SignupState({
    this.autoValidateMode = AutovalidateMode.disabled,
    this.isPasswordVisible = false,
    this.firstNameError,
    this.lastNameError,
    this.emailError,
    this.passwordError,
    this.passwordStrength = PasswordStrength.none,
  });

  SignupState copyWith({
    AutovalidateMode? autoValidateMode,
    bool? isPasswordVisible,
    String? firstNameError,
    String? lastNameError,
    String? emailError,
    String? passwordError,
    PasswordStrength? passwordStrength,
  }) {
    return SignupState(
      autoValidateMode: autoValidateMode ?? this.autoValidateMode,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      firstNameError: firstNameError,
      lastNameError: lastNameError,
      emailError: emailError,
      passwordError: passwordError,
      passwordStrength: passwordStrength ?? this.passwordStrength,
    );
  }
}
