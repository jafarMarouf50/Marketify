part of '../index.dart';

final getIt = GetIt.instance;

Future<void> initializeDependency() async {
  // services
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
