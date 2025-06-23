import 'package:ecommerce_app/core/index.dart';
import 'package:ecommerce_app/presentation/auth/index.dart';
import 'package:ecommerce_app/presentation/splash/bloc/splash_cubit.dart';
import 'package:ecommerce_app/presentation/splash/bloc/splash_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => SigninView()),
          );
        }
      },
      child: Scaffold(
        backgroundColor: AppColorsDark.primary,
        body: Center(child: SvgPicture.asset(AppImages.vectorsLogo)),
      ),
    );
  }
}
