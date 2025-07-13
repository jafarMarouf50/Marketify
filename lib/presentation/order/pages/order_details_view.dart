part of '../index.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key, required this.orderData});

  final OrderEntity orderData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicHomeAppbar(title: Text("Order ${orderData.orderNumber}")),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              sliver: SliverFillRemaining(
                child: Column(
                  children: [
                    OrderStatusTimeline(statuses: orderData.orderStatus),
                    SizedBox(height: 40),
                    OrderItemsSection(),
                    SizedBox(height: 40),
                    ShippingDetailsSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
