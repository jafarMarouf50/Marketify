part of '../index.dart';

class SigninView extends StatefulWidget {
  const SigninView({super.key});

  @override
  State<SigninView> createState() => _SigninViewState();
}

class _SigninViewState extends State<SigninView> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          BasicAppbar(hideBack: true),
          SliverFillRemaining(
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
    return CustomTextField(
      title: "Email Address",
      controller: _emailController,
    );
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(
          context,
          EnterPasswordView(
            loginUserRequest: LoginUserRequest(
              email: _emailController.text,
              password: null,
            ),
          ),
        );
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
