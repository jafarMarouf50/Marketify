part of '../index.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: true),
      body: BlocProvider(create: (_) => EmailCubit(), child: EnterEmailView()),
    );
  }
}
