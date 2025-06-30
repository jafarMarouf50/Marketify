import 'package:ecommerce_app/data/auth/index.dart';
import 'package:ecommerce_app/domain/auth/index.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> initializeDependency() async {
  // service
  // remote
  getIt.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImp());
  // local
  getIt.registerSingleton<AuthLocalService>(AuthLocalServiceImpl());

  // repositories
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // usecase
  getIt.registerSingleton<SignupUseCase>(SignupUseCase());
  getIt.registerSingleton<SigninUseCase>(SigninUseCase());
  getIt.registerSingleton<GetAgesUseCase>(GetAgesUseCase());
  getIt.registerSingleton<ResetPasswordUseCase>(ResetPasswordUseCase());
  getIt.registerSingleton<IsLoggedInUseCase>(IsLoggedInUseCase());
  getIt.registerSingleton<GetCurrentUserUseCase>(GetCurrentUserUseCase());
  getIt.registerSingleton<SignoutUseCase>(SignoutUseCase());
}
