part of '../index.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        BasicAppbar(hideBack: true, title: Text("Notifications")),
        AllNotifications(),
      ],
    );
  }
}
