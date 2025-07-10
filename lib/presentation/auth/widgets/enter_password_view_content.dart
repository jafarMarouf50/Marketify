part of '../index.dart';

class EnterPasswordViewContent extends StatelessWidget {
  const EnterPasswordViewContent({super.key, required this.loginUserRequest});

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
          if (state.dataSuccess == "admin") {
            AppNavigator.pushReplacementAndRemove(context, const AdminHome());
          } else {
            AppNavigator.pushReplacementAndRemove(
              context,
              const CustomBottomNavBar(),
            );
          }
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
    return BlocBuilder<PasswordCubit, PasswordState>(
      builder: (context, state) {
        return CustomTextField(
          title: "Password",
          controller: context.read<PasswordCubit>().passwordController,
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
              context.read<PasswordCubit>().togglePasswordVisibility();
            },
          ),
        );
      },
    );
  }

  Widget _finishButton(BuildContext context) {
    return BlocBuilder<PasswordCubit, PasswordState>(
      builder: (context, state) {
        return BasicReactiveButton(
          onPressed: () {
            final passwordIsValid = context
                .read<PasswordCubit>()
                .validatePassword();
            if (passwordIsValid) {
              final currentPassword = context
                  .read<PasswordCubit>()
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
        context.read<PasswordCubit>().passwordController.clear();
        AppNavigator.push(context, const ForgetPasswordView());
      },
    );
  }
}
