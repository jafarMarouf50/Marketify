part of '../index.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => SignupCubit()),
          BlocProvider(create: (_) => PasswordStrengthCubit()),
        ],
        child: SignupViewContent(),
      ),
    );
  }
}

class SignupViewContent extends StatelessWidget {
  const SignupViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23),
            child: SingleChildScrollView(
              child: BlocBuilder<SignupCubit, SignupState>(
                builder: (context, state) {
                  final passwordStrengthCubit = context
                      .read<PasswordStrengthCubit>();
                  final cubit = context.read<SignupCubit>();
                  return Form(
                    key: cubit.formKey,
                    autovalidateMode: state.autoValidateMode,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TitleScreen(title: "Create Account"),
                        const SizedBox(height: 32),
                        _firstNameField(cubit, state),
                        const SizedBox(height: 20),
                        _lastNameField(cubit, state),
                        const SizedBox(height: 20),
                        _emailField(cubit, state),
                        const SizedBox(height: 20),
                        _passwordField(cubit, state, passwordStrengthCubit),
                        const SizedBox(height: 20),
                        _continueButton(context, cubit),
                        const SizedBox(height: 20),
                        _authPrompt(context),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _firstNameField(SignupCubit cubit, SignupState state) {
    return CustomTextField(
      title: "Firstname",
      controller: cubit.firstNameController,
      errorText: state.firstNameError,
      validator: (value) {
        final firstName = cubit.firstNameController.text;
        if (firstName.trim().isEmpty || firstName.trim().length < 3) {
          return 'First name is required';
        }
        return null;
      },
    );
  }

  Widget _lastNameField(SignupCubit cubit, SignupState state) {
    return CustomTextField(
      title: "Lastname",
      controller: cubit.lastNameController,
      errorText: state.lastNameError,
      validator: (value) {
        final lastName = cubit.lastNameController.text;
        if (lastName.trim().isEmpty || lastName.trim().length < 3) {
          return 'Last name is required';
        }
        return null;
      },
    );
  }

  Widget _emailField(SignupCubit cubit, SignupState state) {
    return CustomTextField(
      title: "Email Address",
      controller: cubit.emailController,
      errorText: state.emailError,
      validator: (value) {
        final email = cubit.emailController.text;
        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(email)) {
          return 'Invalid email format';
        }
        return null;
      },
    );
  }

  Widget _passwordField(
    SignupCubit cubit,
    SignupState state,
    PasswordStrengthCubit passwordStrengthCubit,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextField(
          title: "Password",
          controller: cubit.passwordController,
          errorText: state.passwordError,
          obscureText: !state.isPasswordVisible,
          textInputAction: TextInputAction.done,

          validator: (value) {
            final password = cubit.passwordController.text;
            if (password.length < 8) {
              return 'Password must be at least 8 characters';
            } else if (checkPasswordStrength(value!) == PasswordStrength.weak) {
              return 'Password is too weak';
            }
            return null;
          },
          onChanged: (value) {
            passwordStrengthCubit.updateStrength(checkPasswordStrength(value));
          },
          suffixIcon: IconButton(
            icon: Icon(
              state.isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: cubit.togglePasswordVisibility,
          ),
        ),
        const SizedBox(height: 8),
        PasswordStrengthIndicator(),
      ],
    );
  }

  Widget _continueButton(BuildContext context, SignupCubit cubit) {
    return BasicAppButton(
      onPressed: () {
        if (cubit.formKey.currentState!.validate()) {
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
        } else {
          log("____)))))))))))))______");
          // cubit.autoValidateMode = AutovalidateMode.always;
          cubit.enableAutoValidate();
        }
      },
      title: "Continue",
    );
    // return BlocBuilder<SignupCubit, SignupState>(
    //   builder: (context, state) {
    //
    //   },
    // );
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
