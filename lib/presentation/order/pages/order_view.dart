part of '../index.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(hideBack: true, title: Text("Orders")),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: OrderStatusTabs()),
          const SliverOrdersList(),
        ],
      ),
    );
  }
}

// EmptyNotificationsAndOrders(
//   subtitle: "No Orders yet",
//   image: AppImages.imagesCheckOut,
//   onPressed: () {},
//   buttonTitle: "Explore Categories",
// ),
