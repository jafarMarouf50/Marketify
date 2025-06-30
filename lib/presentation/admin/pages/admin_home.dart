part of '../index.dart';

class AdminHome extends StatelessWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ButtonCubit(),
        child: BlocListener<ButtonCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonStateFailure) {
              var snackBar = AppSnackBar.show(
                Text(state.errMsg),
                backgroundColor: AppColors.danger,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is ButtonStateSuccess) {
              AppNavigator.pushReplacement(context, const SigninView());
            }
          },
          child: Column(
            children: [
              Spacer(),
              Center(child: Text("Admin Home")),
              Spacer(),
              Builder(
                builder: (context) {
                  return BasicReactiveButton(
                    width: MediaQuery.sizeOf(context).width - 40,
                    onPressed: () {
                      context.read<ButtonCubit>().execute(
                        usecase: SignoutUseCase(),
                      );
                    },
                    title: "Sign Out",
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
