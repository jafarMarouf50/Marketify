part of '../index.dart';

class PasswordCubit extends Cubit<PasswordState> {
  final TextEditingController passwordController = TextEditingController();

  static const int minPasswordLength = 8;

  PasswordCubit() : super(const PasswordState()) {
    passwordController.addListener(_onPasswordChanged);
  }

  void _onPasswordChanged() {
    final newPassword = passwordController.text;
    PasswordStrength newStrength = _checkPasswordStrength(newPassword);
    String? newErrorMessage;
    if (!state.forceClearError &&
        newPassword.isNotEmpty &&
        newPassword.length < minPasswordLength) {
      newErrorMessage = null;
    } else {
      newErrorMessage =
          "Password must be at least $minPasswordLength characters.";
    }
    emit(
      state.copyWith(
        password: newPassword,
        strength: newStrength,
        errorMessage: newErrorMessage,
        forceClearError: false,
      ),
    );
  }

  PasswordStrength _checkPasswordStrength(String password) {
    if (password.isEmpty) return PasswordStrength.none;

    bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
    bool hasLowercase = password.contains(RegExp(r'[a-z]'));
    bool hasDigits = password.contains(RegExp(r'[0-9]'));
    bool hasSpecialCharacters = password.contains(
      RegExp(r'[!@#$%^&*(),.?":{}|<>]'),
    );
    int length = password.length;

    int score = 0;
    if (length >= minPasswordLength) score++;
    if (length >= 10) score++;
    if (hasUppercase) score++;
    if (hasLowercase) score++;
    if (hasDigits) score++;
    if (hasSpecialCharacters) score++;

    if (score >= 5) return PasswordStrength.strong;
    if (score >= 3) return PasswordStrength.medium;
    return PasswordStrength.weak;
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  bool validatePassword() {
    final password = state.password;
    if (password.isEmpty) {
      emit(
        state.copyWith(
          errorMessage: "Password cannot be empty.",
          forceClearError: false,
        ),
      );
      return false;
    }
    if (password.length < minPasswordLength) {
      emit(
        state.copyWith(
          errorMessage:
              "Password must be at least $minPasswordLength characters.",
          forceClearError: false,
        ),
      );
      return false;
    }
    emit(state.copyWith(clearErrorMessage: true, forceClearError: true));
    return true;
  }

  @override
  Future<void> close() {
    passwordController.removeListener(_onPasswordChanged);
    passwordController.dispose();
    return super.close();
  }
}
