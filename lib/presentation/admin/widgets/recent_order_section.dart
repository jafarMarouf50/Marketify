part of '../index.dart';

class RecentOrdersSection extends StatelessWidget {
  const RecentOrdersSection({super.key});

  List<RecentOrder> get _recentOrders => RecentOrdersList.recentOrders();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColorsDark.secondary,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _header(),
          ...List.generate(
            _recentOrders.length,
            (index) => OrderTile(
              order: _recentOrders[index],
              showDivider: index < _recentOrders.length - 1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _header() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Recent Orders',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          GestureDetector(
            onTap: () {},
            child: const Row(
              children: [
                Text(
                  'View All',
                  style: TextStyle(
                    color: Color(0xFF3B82F6),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Color(0xFF3B82F6),
                  size: 14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
