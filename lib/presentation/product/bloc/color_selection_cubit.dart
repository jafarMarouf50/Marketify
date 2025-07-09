part of '../index.dart';

class ColorSelectionCubit extends Cubit<int> {
  ColorSelectionCubit() : super(-1);

  void itemSelection(int index) {
    emit(index);
  }

  void clearSelection() {
    emit(-1);
  }

  int get selectedIndex => state;
}
