part of '../index.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicHomeAppbar(hideBack: true),
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(AppImages.vectorsEmailSending),
                SizedBox(height: 24),
                Text(
                  "We Sent you an Email to reset your password.",
                  style: AppStyles.styleMedium20(context).copyWith(),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                _returnToLogin(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _returnToLogin(BuildContext context) {
    return BasicAppButton(
      onPressed: () {
        AppNavigator.pushReplacementAndRemove(context, const SigninView());
      },
      title: "Return to Login",
      width: MediaQuery.sizeOf(context).width / 2.7,
    );
  }
}
