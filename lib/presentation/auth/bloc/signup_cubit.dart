part of '../index.dart';

class SignupCubit extends Cubit<SignupState> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  SignupCubit() : super(SignupState()) {
    firstNameController.addListener(validateAll);
    lastNameController.addListener(validateAll);
    emailController.addListener(validateAll);
    passwordController.addListener(validateAll);
  }

  void validateAll() {
    final firstName = firstNameController.text;
    final lastName = lastNameController.text;
    final email = emailController.text;
    final password = passwordController.text;

    String? emailError;
    String? firstNameError;
    String? lastNameError;
    String? passwordError;

    // Basic validations
    if (firstName.trim().isEmpty) firstNameError = 'First name is required';
    if (lastName.trim().isEmpty) lastNameError = 'Last name is required';
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
      emailError = 'Invalid email format';
    }

    // Password validation
    PasswordStrength? strength;
    if (password.isNotEmpty) {
      strength = checkPasswordStrength(password);
    }
    if (password.length < 8) {
      passwordError = 'Password must be at least 8 characters';
    } else if (strength == PasswordStrength.weak) {
      passwordError = 'Password is too weak';
    }

    emit(
      state.copyWith(
        firstNameError: firstNameError,
        lastNameError: lastNameError,
        emailError: emailError,
        passwordError: passwordError,
        passwordStrength: strength,
      ),
    );
  }

  void togglePasswordVisibility() {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  @override
  Future<void> close() {
    firstNameController.removeListener(validateAll);
    lastNameController.removeListener(validateAll);
    emailController.removeListener(validateAll);
    passwordController.removeListener(validateAll);
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
