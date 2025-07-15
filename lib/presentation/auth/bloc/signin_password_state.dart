part of '../index.dart';

class SigninPasswordState {
  final String password;
  final bool isPasswordVisible;
  final PasswordStrength strength;
  final String? errorMessage;
  final bool forceClearError;

  const SigninPasswordState({
    this.password = "",
    this.isPasswordVisible = false,
    this.strength = PasswordStrength.none,
    this.errorMessage,
    this.forceClearError = false,
  });

  SigninPasswordState copyWith({
    String? password,
    bool? isPasswordVisible,
    PasswordStrength? strength,
    String? errorMessage,
    bool clearErrorMessage = false,
    bool? forceClearError,
  }) {
    return SigninPasswordState(
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      strength: strength ?? this.strength,
      errorMessage: clearErrorMessage
          ? null
          : errorMessage ?? this.errorMessage,
      forceClearError: forceClearError ?? this.forceClearError,
    );
  }
}
