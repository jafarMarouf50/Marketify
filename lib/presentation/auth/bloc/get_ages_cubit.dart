part of '../index.dart';

class GetAgesCubit extends Cubit<GetAgesState> {
  GetAgesCubit() : super(GetAgesInitial());

  Future<void> getAges() async {
    emit(GetAgesLoading());
    var result = await getIt<GetAgesUseCase>().call();
    result.fold(
      (error) {
        emit(GetAgesFailure(errMsg: error));
      },
      (data) {
        emit(GetAgesLoaded(ages: data));
      },
    );
  }
}
