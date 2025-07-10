part of '../index.dart';

class EnterEmailView extends StatelessWidget {
  const EnterEmailView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<EmailCubit, EmailState>(
      listener: (context, state) {
        if (state is ReadyToContinue) {
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
      child: CustomScrollView(
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
    );
  }

  Widget _emailField() {
    return BlocBuilder<EmailCubit, EmailState>(
      builder: (context, state) {
        String? errorText;
        if (state is EmailInvalid) {
          errorText = state.errorMessage;
        }

        return CustomTextField(
          title: "Email Address",
          controller: context.read<EmailCubit>().emailController,
          errorText: errorText,
        );
      },
    );
  }

  Widget _continueButton(BuildContext context) {
    return BlocBuilder<EmailCubit, EmailState>(
      builder: (context, state) {
        return BasicAppButton(
          onPressed: () {
            context.read<EmailCubit>().validateAndProceed();
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
        context.read<EmailCubit>().reset();
        AppNavigator.push(context, SignupView());
      },
    );
  }
}
