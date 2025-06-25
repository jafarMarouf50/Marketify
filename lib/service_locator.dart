import 'package:ecommerce_app/data/auth/index.dart';
import 'package:ecommerce_app/domain/auth/index.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initializeDependency() async {
  // service
  getIt.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImp());

  // repositories
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // usecase
  getIt.registerSingleton<SignupUseCase>(SignupUseCase());
  getIt.registerSingleton<SigninUseCase>(SigninUseCase());
  getIt.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  getIt.registerSingleton<ResetPasswordUseCase>(ResetPasswordUseCase());
}
