part of '../index.dart';

class QuantityCubit extends Cubit<QuantityState> {
  QuantityCubit() : super(QuantityInitial());

  int counter = 1;

  void increase() {
    counter = counter + 1;
    emit(QuantityIncrease());
  }

  void decrease() {
    if (counter > 1) {
      counter = counter - 1;
      emit(QuantityDecrease());
    }
  }
}
