part of '../index.dart';

class OrderStatusTimeline extends StatelessWidget {
  const OrderStatusTimeline({super.key, required this.statuses});

  final List<OrderStatusEntity> statuses;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < statuses.length; i++)
          OrderStatusItem(
            statusData: statuses[i],
            isLast: i == statuses.length - 1,
          ),
      ],
    );
  }
}
