part of '../index.dart';

@immutable
sealed class EmailState {}

final class EmailInitial extends EmailState {}

class EmailValid extends EmailState {
  final String email;

  EmailValid(this.email);
}

class EmailInvalid extends EmailState {
  final String errorMessage;

  EmailInvalid(this.errorMessage);
}

class ReadyToContinue extends EmailState {
  final String email;

  ReadyToContinue(this.email);
}
