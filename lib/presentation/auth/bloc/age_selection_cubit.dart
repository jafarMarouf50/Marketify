part of '../index.dart';

class AgeSelectionCubit extends Cubit<String> {
  AgeSelectionCubit() : super('Age Range');

  String selectedAge = 'Age Range';

  void selectAge(String age) {
    selectedAge = age;
    emit(age);
  }
}
