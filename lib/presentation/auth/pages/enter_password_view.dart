part of '../index.dart';

class EnterPasswordView extends StatefulWidget {
  const EnterPasswordView({super.key, required this.loginUserRequest});

  final LoginUserRequest loginUserRequest;

  @override
  State<EnterPasswordView> createState() => _EnterPasswordViewState();
}

class _EnterPasswordViewState extends State<EnterPasswordView> {
  final passwordController = TextEditingController();

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
              AppNavigator.pushReplacementAndRemove(
                context,
                const CustomBottomNavBar(),
              );
            }
          },
          child: CustomScrollView(
            slivers: [
              BasicAppbar(),
              SliverFillRemaining(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 23),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleScreen(title: "Sign in"),
                      const SizedBox(height: 32),
                      _passwordField(),
                      const SizedBox(height: 20),
                      _continueButton(context),
                      const SizedBox(height: 20),
                      _authPrompt(context),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return CustomTextField(title: "Password", controller: passwordController);
  }

  Widget _continueButton(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        return BasicReactiveButton(
          onPressed: () {
            widget.loginUserRequest.password = passwordController.text;
            context.read<ButtonCubit>().execute(
              usecase: SigninUseCase(),
              params: widget.loginUserRequest,
            );
          },
          title: "Finish",
        );
      },
    );
  }

  Widget _authPrompt(BuildContext context) {
    return AuthPrompt(
      promptText: "Forget Password? ",
      actionText: "Reset",
      onTap: () {
        AppNavigator.push(context, const ForgetPasswordView());
      },
    );
  }
}
