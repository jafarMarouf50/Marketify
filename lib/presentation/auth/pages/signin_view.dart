part of '../index.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninEmailCubit, SigninEmailState>(
      listener: (context, state) {
        if (state is SigninReadyToContinue) {
          AppNavigator.push(
            context,
            EnterPasswordView(
              loginUserRequest: LoginUserRequest(
                email: state.email,
                password: null,
              ),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: BasicAppbar(hideBack: true),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TitleScreen(title: "Sign in"),
                    const SizedBox(height: 32),
                    _emailField(),
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
    );
  }

  Widget _emailField() {
    return BlocBuilder<SigninEmailCubit, SigninEmailState>(
      builder: (context, state) {
        String? errorText;
        if (state is SigninEmailInvalid) {
          errorText = state.errorMessage;
        }

        return CustomTextField(
          title: "Email Address",
          controller: context.read<SigninEmailCubit>().emailController,
          errorText: errorText,
        );
      },
    );
  }

  Widget _continueButton(BuildContext context) {
    return BlocBuilder<SigninEmailCubit, SigninEmailState>(
      builder: (context, state) {
        return BasicAppButton(
          onPressed: () {
            context.read<SigninEmailCubit>().validateAndProceed();
          },
          title: "Continue",
        );
      },
    );
  }

  Widget _authPrompt(BuildContext context) {
    return AuthPrompt(
      promptText: "Don't have an Account? ",
      actionText: "Create One",
      onTap: () {
        context.read<SigninEmailCubit>().reset();
        AppNavigator.push(context, SignupView());
      },
    );
  }
}
