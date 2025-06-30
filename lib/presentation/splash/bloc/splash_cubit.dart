part of '../index.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(Duration(seconds: 2));
    String isLogged = await getIt<IsLoggedInUseCase>().call();
    if (isLogged != '') {
      emit(Authenticated(role: isLogged));
    } else {
      emit(UnAuthenticated());
    }
  }
}
