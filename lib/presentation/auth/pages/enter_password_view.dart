part of '../index.dart';

class EnterPasswordView extends StatelessWidget {
  const EnterPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: Padding(
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
    );
  }

  Widget _passwordField() {
    return CustomTextField(
      title: "Password",
      controller: TextEditingController(),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(onPressed: () {}, title: "Continue");
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
