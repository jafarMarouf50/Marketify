part of '../index.dart';

class ForgetPasswordView extends StatefulWidget {
  const ForgetPasswordView({super.key});

  @override
  State<ForgetPasswordView> createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),

      body: BlocProvider(
        create: (_) => ButtonCubit(),
        child: BlocListener<ButtonCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonStateFailure) {
              var snackBar = AppSnackBar.show(
                Text(state.errMsg),
                backgroundColor: AppColors.danger,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
        ),
      ),
    );
  }

  Widget _emailField() {
    return CustomTextField(
      title: "Enter Email Address",
      controller: _emailController,
    );
  }

  Widget _continueButton(BuildContext context) {
    return Builder(
      builder: (context) {
        return BasicReactiveButton(
          onPressed: () {
            context.read<ButtonCubit>().execute(
              usecase: ResetPasswordUseCase(),
              params: _emailController.text,
            );
          },
          title: "Continue",
        );
      },
    );
  }
}
