part of '../index.dart';

class OrderArrow extends StatelessWidget {
  const OrderArrow({super.key, required this.orderData});

  final OrderEntity orderData;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.push(context, OrderDetailsView(orderData: orderData));
      },
      child: SvgPicture.asset(
        AppImages.vectorsArrowRight,
        height: 24,
        width: 24,
      ),
    );
  }
}
