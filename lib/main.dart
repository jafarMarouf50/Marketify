import 'package:ecommerce_app/bloc_observer.dart';
import 'package:ecommerce_app/core/index.dart';
import 'package:ecommerce_app/domain/auth/index.dart';
import 'package:ecommerce_app/firebase_options.dart';
import 'package:ecommerce_app/presentation/splash/index.dart';
import 'package:ecommerce_app/service_locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  initializeDependency();
  Bloc.observer = const AppBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(UserEntityAdapter());

  await Hive.openBox<UserEntity>(AppConstants.kUserBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SplashCubit()..appStarted()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkTheme,
        home: SplashView(),
      ),
    );
  }
}
