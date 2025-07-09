part of '../index.dart';

class SizeSelectionCubit extends Cubit<int> {
  SizeSelectionCubit() : super(-1);

  void itemSelection(int index) {
    emit(index);
  }

  void clearSelection() {
    emit(-1);
  }

  int get selectedIndex => state;
}
