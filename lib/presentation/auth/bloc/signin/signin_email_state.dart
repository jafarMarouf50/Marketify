part of '../../index.dart';

@immutable
sealed class SigninEmailState {}

final class SigninEmailInitial extends SigninEmailState {}

class SigninEmailValid extends SigninEmailState {
  final String email;

  SigninEmailValid(this.email);
}

class SigninEmailInvalid extends SigninEmailState {
  final String errorMessage;

  SigninEmailInvalid(this.errorMessage);
}

class SigninReadyToContinue extends SigninEmailState {
  final String email;

  SigninReadyToContinue(this.email);
}
