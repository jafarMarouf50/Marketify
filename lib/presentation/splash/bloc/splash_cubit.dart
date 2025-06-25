import 'package:ecommerce_app/domain/auth/index.dart';
import 'package:ecommerce_app/presentation/splash/bloc/splash_state.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(DisplaySplash());

  void appStarted() async {
    await Future.delayed(Duration(seconds: 2));
    bool isLogged = await getIt<IsLoggedInUseCase>().call();
    if (isLogged) {
      emit(Authenticated());
    } else {
      emit(UnAuthenticated());
    }
  }
}
