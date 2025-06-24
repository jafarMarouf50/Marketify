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
      appBar: BasicAppbar(),
      body: BlocProvider(
        create: (context) => ButtonCubit(),
        child: BlocListener<ButtonCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonStateFailure) {
              var snackBar = SnackBar(
                content: Text(state.errMsg),
                behavior: SnackBarBehavior.floating,
                showCloseIcon: true,
                backgroundColor: AppColorsDark.primary,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is ButtonStateSuccess) {
              var snackBar = SnackBar(
                content: Text("Login Success"),
                behavior: SnackBarBehavior.floating,
                duration: Duration(seconds: 2),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
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
