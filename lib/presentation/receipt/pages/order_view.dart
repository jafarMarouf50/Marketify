part of '../index.dart';

class ReceiptView extends StatelessWidget {
  const ReceiptView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BasicAppbar(hideBack: true, title: Text("Orders")),
        const SliverToBoxAdapter(child: OrderStatusTabs()),
        const SliverOrdersList(),
      ],
    );
  }
}

// EmptyNotificationsAndOrders(
//   subtitle: "No Orders yet",
//   image: AppImages.imagesCheckOut,
//   onPressed: () {},
//   buttonTitle: "Explore Categories",
// ),
