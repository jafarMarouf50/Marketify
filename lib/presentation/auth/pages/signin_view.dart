part of '../index.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppbar(hideBack: true),
      body: Padding(
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
    );
  }

  Widget _emailField() {
    return CustomTextField(
      title: "Email Address",
      controller: TextEditingController(),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(context, const EnterPasswordView());
      },
      title: "Continue",
    );
  }

  Widget _authPrompt(BuildContext context) {
    return AuthPrompt(
      promptText: "Don't have an Account? ",
      actionText: "Create One",
      onTap: () {
        AppNavigator.push(context, SignupView());
      },
    );
  }
}
