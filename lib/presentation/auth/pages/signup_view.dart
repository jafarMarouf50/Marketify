part of '../index.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicHomeAppbar(),
      body: BlocProvider(
        create: (_) => SignupCubit(),
        child: SignupViewContent(),
      ),
    );
  }
}

class SignupViewContent extends StatelessWidget {
  const SignupViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignupCubit>();
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleScreen(title: "Create Account"),
                  const SizedBox(height: 32),
                  _firstNameField(cubit),
                  const SizedBox(height: 20),
                  _lastNameField(cubit),
                  const SizedBox(height: 20),
                  _emailField(cubit),
                  const SizedBox(height: 20),
                  _passwordField(cubit),
                  const SizedBox(height: 20),

                  _continueButton(context, cubit),
                  const SizedBox(height: 20),
                  _authPrompt(context),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _firstNameField(SignupCubit cubit) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return CustomTextField(
          title: "Firstname",
          controller: cubit.firstNameController,
          errorText: state.firstNameError,
        );
      },
    );
  }

  Widget _lastNameField(SignupCubit cubit) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return CustomTextField(
          title: "Lastname",
          controller: cubit.lastNameController,
          errorText: state.lastNameError,
        );
      },
    );
  }

  Widget _emailField(SignupCubit cubit) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return CustomTextField(
          title: "Email Address",
          controller: cubit.emailController,
          errorText: state.emailError,
        );
      },
    );
  }

  Widget _passwordField(SignupCubit cubit) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextField(
              title: "Password",
              controller: cubit.passwordController,
              errorText: state.passwordError,
              obscureText: !state.isPasswordVisible,
              textInputAction: TextInputAction.done,
              suffixIcon: IconButton(
                icon: Icon(
                  state.isPasswordVisible
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: cubit.togglePasswordVisibility,
              ),
            ),
            const SizedBox(height: 8),
            state.passwordStrength != PasswordStrength.none
                ? PasswordStrengthIndicator(strength: state.passwordStrength)
                : Container(),
          ],
        );
      },
    );
  }

  Widget _continueButton(BuildContext context, SignupCubit cubit) {
    return BlocBuilder<SignupCubit, SignupState>(
      builder: (context, state) {
        return BasicAppButton(
          onPressed: () {
            cubit.validateAll();
            final hasErrors =
                state.emailError != null ||
                state.passwordError != null ||
                state.firstNameError != null ||
                state.lastNameError != null;
            if (!hasErrors) {
              AppNavigator.push(
                context,
                GenderAndAgeSelectionView(
                  userRequest: CreateUserRequest(
                    firstName: cubit.firstNameController.text,
                    lastName: cubit.lastNameController.text,
                    email: cubit.emailController.text,
                    password: cubit.passwordController.text,
                    gender: null,
                    age: null,
                    role: 'customer',
                  ),
                ),
              );
            }
          },
          title: "Continue",
        );
      },
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
