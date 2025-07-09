part of '../index.dart';

class OrderInfo extends StatelessWidget {
  final OrderEntity orderData;

  const OrderInfo({super.key, required this.orderData});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order ${orderData.orderNumber}',
          style: AppStyles.styleMedium16(context),
        ),
        const SizedBox(height: 2),
        Text(
          '${orderData.itemCount} ${orderData.itemCount == 1 ? 'Item' : 'Items'}',
          style: AppStyles.styleRegular14(
            context,
          ).copyWith(color: AppColorsDark.smallText),
        ),
      ],
    );
  }
}
