part of '../index.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          AppNavigator.pushReplacementAndRemove(context, const SigninView());
        }
        if (state is Authenticated) {
          state.role == 'admin'
              ? AppNavigator.pushReplacementAndRemove(
                  context,
                  const BottomNavBar(navBarType: NavBarType.admin),
                )
              : AppNavigator.pushReplacementAndRemove(
                  context,
                  const BottomNavBar(navBarType: NavBarType.customer),
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
