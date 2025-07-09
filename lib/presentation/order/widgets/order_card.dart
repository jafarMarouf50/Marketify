part of '../index.dart';

class OrderCard extends StatelessWidget {
  final OrderEntity orderData;

  const OrderCard({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          AppNavigator.push(context, OrderDetailsView(orderData: orderData)),
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColorsDark.container,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            const OrderIcon(),
            const SizedBox(width: 20),
            Expanded(child: OrderInfo(orderData: orderData)),
            OrderArrow(orderData: orderData),
          ],
        ),
      ),
    );
  }
}
