part of '../index.dart';

class PasswordCubit extends Cubit<PasswordState> {
  final TextEditingController passwordController = TextEditingController();

  static const int minPasswordLength = 8;

  PasswordCubit() : super(const PasswordState()) {
    passwordController.addListener(_onPasswordChanged);
  }

  void _onPasswordChanged() {
    final newPassword = passwordController.text;
    bool isValidLength = newPassword.length >= minPasswordLength;

    emit(
      state.copyWith(
        password: newPassword,
        strength: isValidLength
            ? PasswordStrength.strong
            : PasswordStrength.none,
        errorMessage: isValidLength
            ? null
            : "Password must be at least $minPasswordLength characters.",
        forceClearError: false,
      ),
    );
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  bool validatePassword() {
    final password = state.password;
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
