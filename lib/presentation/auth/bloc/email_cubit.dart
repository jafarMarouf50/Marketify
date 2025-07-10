part of '../index.dart';

class EmailCubit extends Cubit<EmailState> {
  EmailCubit() : super(EmailInitial()) {
    emailController.addListener(emailChanged);
  }

  final TextEditingController emailController = TextEditingController();
  final RegExp _emailRegExp = RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+');

  void emailChanged() {
    final email = emailController.text;
    if (email.isEmpty) {
      emit(EmailInitial());
    } else if (!_emailRegExp.hasMatch(email)) {
      emit(EmailInvalid("Please enter a valid email address."));
    } else {
      emit(EmailValid(email));
    }
  }

  void validateCurrentEmail() {
    emailController.text;
    emailChanged();
  }

  void validateAndProceed() {
    final email = emailController.text;
    if (email.isEmpty) {
      emit(EmailInvalid("Email cannot be empty."));
      return;
    }
    if (!_emailRegExp.hasMatch(email)) {
      emit(EmailInvalid("Please enter a valid email address."));
      return;
    }
    emit(ReadyToContinue(email));
  }

  void reset() {
    emailController.clear();
    emit(EmailInitial());
  }

  @override
  Future<void> close() {
    emailController.removeListener(emailChanged);
    emailController.dispose();
    return super.close();
  }
}
