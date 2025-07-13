part of '../index.dart';

class OrderView extends StatelessWidget {
  const OrderView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicHomeAppbar(hideBack: true, title: Text("Orders")),
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(child: OrderStatusTabs()),
          const SliverOrdersList(),
        ],
      ),
    );
  }
}

// EmptyScreen(
// subtitle: "Your Cart is Empty",
// image: SvgPicture.asset(AppImages.vectorsCartBag),
// onPressed: () {},
// buttonTitle: 'Explore Categories',
// ),
