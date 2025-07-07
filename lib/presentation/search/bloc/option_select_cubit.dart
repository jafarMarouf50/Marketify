part of '../index.dart';

class OptionSelectCubit extends Cubit<String> {
  OptionSelectCubit(super.initialValue);

  void select(String value) => emit(value);
}
