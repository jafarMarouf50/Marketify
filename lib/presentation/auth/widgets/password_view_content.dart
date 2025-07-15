part of '../index.dart';

class PasswordViewContent extends StatelessWidget {
  const PasswordViewContent({super.key, required this.loginUserRequest});

  final LoginUserRequest loginUserRequest;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonCubit, ButtonState>(
      listener: (context, state) {
        if (state is ButtonStateFailure) {
          final snackBar = AppSnackBar.show(
            Text(state.errMsg),
            backgroundColor: AppColors.danger,
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
        if (state is ButtonStateSuccess) {
          state.dataSuccess == "admin"
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
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TitleScreen(title: "Enter Password"),
                    const SizedBox(height: 8),
                    Text(
                      "Enter password for ${loginUserRequest.email}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(height: 32),
                    _passwordField(context),
                    const SizedBox(height: 20),
                    _finishButton(context),
                    const SizedBox(height: 20),
                    _authPrompt(context),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(height: 50),
            ),
          ],
        ),
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return BlocBuilder<SigninPasswordCubit, SigninPasswordState>(
      builder: (context, state) {
        return CustomTextField(
          title: "Password",
          controller: context.read<SigninPasswordCubit>().passwordController,
          errorText: state.strength == PasswordStrength.strong
              ? null
              : state.errorMessage,
          obscureText: !state.isPasswordVisible,
          suffixIcon: IconButton(
            icon: Icon(
              !state.isPasswordVisible
                  ? Icons.visibility_off
                  : Icons.visibility,
            ),
            onPressed: () {
              context.read<SigninPasswordCubit>().togglePasswordVisibility();
            },
          ),
        );
      },
    );
  }

  Widget _finishButton(BuildContext context) {
    return BlocBuilder<SigninPasswordCubit, SigninPasswordState>(
      builder: (context, state) {
        return BasicReactiveButton(
          onPressed: () {
            final passwordIsValid = context
                .read<SigninPasswordCubit>()
                .validatePassword();
            if (passwordIsValid) {
              final currentPassword = context
                  .read<SigninPasswordCubit>()
                  .state
                  .password;
              loginUserRequest.password = currentPassword;

              context.read<ButtonCubit>().execute(
                usecase: SigninUseCase(),
                params: loginUserRequest,
              );
            }
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
        context.read<SigninPasswordCubit>().passwordController.clear();
        AppNavigator.push(context, const ForgetPasswordView());
      },
    );
  }
}
