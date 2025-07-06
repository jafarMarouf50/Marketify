part of '../index.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: true, title: Text("Notifications")),
      body: const CustomScrollView(slivers: [AllNotifications()]),
    );
  }
}

// EmptyNotificationsAndOrders(
// subtitle: "No Notifications yet",
// image: AppImages.imagesBell,
// onPressed: () {},
// buttonTitle: "Explore Categories",
// ),
