part of '../index.dart';

class GenderSelectionCubit extends Cubit<int> {
  GenderSelectionCubit() : super(1);

  int selectIndex = 1;

  void selectGender(int gender) {
    selectIndex = gender;
    emit(gender);
  }
}
