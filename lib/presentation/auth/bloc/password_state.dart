part of '../index.dart';

class PasswordState {
  final String password;
  final bool isPasswordVisible;
  final PasswordStrength strength;
  final String? errorMessage;
  final bool forceClearError;

  const PasswordState({
    this.password = "",
    this.isPasswordVisible = false,
    this.strength = PasswordStrength.none,
    this.errorMessage,
    this.forceClearError = false,
  });

  PasswordState copyWith({
    String? password,
    bool? isPasswordVisible,
    PasswordStrength? strength,
    String? errorMessage,
    bool clearErrorMessage = false,
    bool? forceClearError,
  }) {
    return PasswordState(
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
