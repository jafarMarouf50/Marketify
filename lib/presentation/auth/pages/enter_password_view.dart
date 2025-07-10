part of '../index.dart';

class EnterPasswordView extends StatelessWidget {
  final LoginUserRequest loginUserRequest;

  const EnterPasswordView({super.key, required this.loginUserRequest});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => PasswordCubit()),
          BlocProvider(create: (_) => ButtonCubit()),
        ],
        child: EnterPasswordViewContent(loginUserRequest: loginUserRequest),
      ),
    );
  }
}
