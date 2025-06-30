part of '../index.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _lastNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          BasicAppbar(),
          SliverFillRemaining(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: SingleChildScrollView(
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _firstNameField() {
    return CustomTextField(
      title: "Firstname",
      controller: _firstNameController,
    );
  }

  Widget _lastNameField() {
    return CustomTextField(title: "Lastname", controller: _lastNameController);
  }

  Widget _emailField() {
    return CustomTextField(
      title: "Email Address",
      controller: _emailController,
    );
  }

  Widget _passwordField() {
    return CustomTextField(title: "Password", controller: _passwordController);
  }

  Widget _continueButton(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.push(
          context,
          GenderAndAgeSelectionView(
            userRequest: CreateUserRequest(
              firstName: _firstNameController.text,
              lastName: _lastNameController.text,
              email: _emailController.text,
              password: _passwordController.text,
              gender: null,
              age: null,
              role: 'customer',
            ),
          ),
        );
      },
      title: "Continue",
    );
  }

  Widget _authPrompt(BuildContext context) {
    return AuthPrompt(
      promptText: "Do you have an Account? ",
      actionText: "Sign in",
      onTap: () {
        AppNavigator.pushReplacementAndRemove(context, const SigninView());
      },
    );
  }
}
