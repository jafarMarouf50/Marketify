part of '../index.dart';

class AgeSelectionCubit extends Cubit<String> {
  AgeSelectionCubit() : super('Age Range');

  String selectIndex = 'Age Range';

  void selectAge(String age) {
    selectIndex = age;
    emit(age);
  }
}
