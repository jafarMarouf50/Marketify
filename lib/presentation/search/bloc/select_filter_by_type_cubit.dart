part of '../index.dart';

class SelectFilterByTypeCubit extends Cubit<String> {
  SelectFilterByTypeCubit() : super("");
  String selectTypeFilter = '';

  void selectFilterByType(String filter) {
    selectTypeFilter = filter;
    emit(filter);
  }
}
