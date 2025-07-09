part of '../index.dart';

class OrderStatusItem extends StatelessWidget {
  final OrderStatusEntity statusData;
  final bool isLast;

  const OrderStatusItem({
    super.key,
    required this.statusData,
    required this.isLast,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StatusIndicator(
            isCompleted: statusData.isCompleted,
            isActive: statusData.isActive,
          ),
          const SizedBox(width: 17),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  statusData.title,
                  style: TextStyle(
                    color: statusData.isCompleted
                        ? Colors.white
                        : AppColorsDark.smallText,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  statusData.date,
                  style: TextStyle(
                    color: statusData.isCompleted
                        ? Colors.white
                        : AppColorsDark.smallText,
                    fontSize: 14,
                  ),
                ),
                if (!isLast) const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
