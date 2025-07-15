part of '../index.dart';

class PasswordStrengthCubit extends Cubit<PasswordStrengthState> {
  PasswordStrengthCubit()
    : super(PasswordStrengthState(strength: PasswordStrength.none));

  void updateStrength(PasswordStrength strength) {
    emit(PasswordStrengthState(strength: strength));
  }
}
