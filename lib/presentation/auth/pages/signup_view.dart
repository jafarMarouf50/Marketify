part of '../index.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleScreen(title: "Create Account"),
            const SizedBox(height: 32),
            _firstNameField(),
            const SizedBox(height: 20),
            _lastNameField(),
            const SizedBox(height: 20),
            _emailField(),
            const SizedBox(height: 20),
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

  Widget _firstNameField() {
    return CustomTextField(
      title: "Firstname",
      controller: TextEditingController(),
    );
  }

  Widget _lastNameField() {
    return CustomTextField(
      title: "Lastname",
      controller: TextEditingController(),
    );
  }

  Widget _emailField() {
    return CustomTextField(
      title: "Email Address",
      controller: TextEditingController(),
    );
  }

  Widget _passwordField() {
    return CustomTextField(
      title: "Password",
      controller: TextEditingController(),
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(context, GenderAndAgeSelectionView());
      },
      title: "Continue",
    );
  }

  Widget _authPrompt(BuildContext context) {
    return AuthPrompt(
      promptText: "Do you have an Account? ",
      actionText: "Sign in",
      onTap: () {
        AppNavigator.pushReplacement(context, const SigninView());
      },
    );
  }
}
