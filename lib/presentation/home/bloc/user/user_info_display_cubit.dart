part of '../../index.dart';

class UserInfoDisplayCubit extends Cubit<UserInfoDisplayState> {
  UserInfoDisplayCubit() : super(UserInfoDisplayLoading());

  void displayUser() async {
    var result = await getIt<GetCurrentUserUseCase>().call();
    result.fold(
          (error) {
        emit(LoadUserFailure(errMsg: error));
      },
          (user) {
        emit(UserInfoDisplayLoaded(user: user));
      },
    );
  }
}
