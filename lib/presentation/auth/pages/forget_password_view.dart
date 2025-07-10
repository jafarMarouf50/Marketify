part of '../index.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => EmailCubit()),
          BlocProvider(create: (_) => ButtonCubit()),
        ],
        child: ForgetPasswordViewContent(),
      ),
    );
  }
}

class ForgetPasswordViewContent extends StatelessWidget {
  const ForgetPasswordViewContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ButtonCubit, ButtonState>(
      listener: (context, state) {
        if (state is ButtonStateFailure) {
          var snackBar = AppSnackBar.show(
            Text(state.errMsg),
            backgroundColor: AppColors.danger,
          );
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(snackBar);
        }
        if (state is ButtonStateSuccess) {
          var snackBar = AppSnackBar.show(Text(state.dataSuccess));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
          AppNavigator.pushReplacementAndRemove(
            context,
            const ResetPasswordView(),
          );
        }
      },
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleScreen(title: "Forget Password"),
                  const SizedBox(height: 32),
                  _emailField(),
                  const SizedBox(height: 20),
                  _continueButton(context),
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
    // return CustomTextField(
    //   title: "Enter Email Address",
    //   controller: _emailController,
    // );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            context.read<EmailCubit>().validateAndProceed();
            context.read<ButtonCubit>().execute(
              usecase: ResetPasswordUseCase(),
              params: context.read<EmailCubit>().emailController.text,
            );
          },
          title: "Continue",
        );
      },
    );
    // return Builder(
    //   builder: (context) {
    //     return BasicReactiveButton(
    //       onPressed: () {
    //         context.read<ButtonCubit>().execute(
    //           usecase: ResetPasswordUseCase(),
    //           params: _emailController.text,
    //         );
    //       },
    //       title: "Continue",
    //     );
    //   },
    // );
  }
}
