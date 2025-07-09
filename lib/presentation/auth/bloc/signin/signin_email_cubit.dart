part of '../../index.dart';

class SigninEmailCubit extends Cubit<SigninEmailState> {
  SigninEmailCubit() : super(SigninEmailInitial()) {
    emailController.addListener(emailChanged);
  }

  final TextEditingController emailController = TextEditingController();
  final RegExp _emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

  void emailChanged() {
    final email = emailController.text;
    if (email.isEmpty) {
      emit(SigninEmailInitial());
    } else if (!_emailRegExp.hasMatch(email)) {
      emit(SigninEmailInvalid("Please enter a valid email address."));
    } else {
      emit(SigninEmailValid(email));
    }
  }

  void validateCurrentEmail() {
    final email = emailController.text;
    emailChanged();
  }

  void validateAndProceed() {
    final email = emailController.text;
    if (email.isEmpty) {
      emit(SigninEmailInvalid("Email cannot be empty."));
      return;
    }
    if (!_emailRegExp.hasMatch(email)) {
      emit(SigninEmailInvalid("Please enter a valid email address."));
      return;
    }
    emit(SigninReadyToContinue(email));
  }

  void reset() {
    emailController.clear();
    emit(SigninEmailInitial());
  }

  @override
  Future<void> close() {
    emailController.removeListener(emailChanged);
    emailController.dispose();
    return super.close();
  }
}
