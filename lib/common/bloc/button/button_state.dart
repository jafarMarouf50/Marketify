part of '../../index.dart';

@immutable
sealed class ButtonState {}

final class ButtonStateInitial extends ButtonState {}

final class ButtonStateLoading extends ButtonState {}

final class ButtonStateSuccess extends ButtonState {}

final class ButtonStateFailure extends ButtonState {
  final String errMsg;

  ButtonStateFailure({required this.errMsg});
}
