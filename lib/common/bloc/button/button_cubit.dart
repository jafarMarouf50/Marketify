part of '../../index.dart';

class ButtonCubit extends Cubit<ButtonState> {
  ButtonCubit() : super(ButtonStateInitial());

  Future<void> execute({dynamic params, required UseCase usecase}) async {
    emit(ButtonStateLoading());
    try {
      final result = await usecase.call(params: params);

      result.fold(
        (error) {
          emit(ButtonStateFailure(errMsg: error));
        },
        (data) {
          emit(ButtonStateSuccess(dataSuccess: data));
        },
      );
    } catch (e) {
      emit(ButtonStateFailure(errMsg: e.toString()));
    }
  }
}
