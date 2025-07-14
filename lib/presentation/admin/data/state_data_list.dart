part of '../index.dart';

class StatDataList {
  static List<StatData> statData() {
    return [
      StatData(
        title: 'Total Revenue',
        value: '\$45,231.89',
        change: '+20.1%',
        trend: 'up',
        icon: Icons.attach_money,
        color: const Color(0xFF10B981),
      ),
      StatData(
        title: 'Orders',
        value: '1,234',
        change: '+12.3%',
        trend: 'up',
        icon: Icons.shopping_cart,
        color: const Color(0xFF3B82F6),
      ),
      StatData(
        title: 'Products',
        value: '568',
        change: '+5.4%',
        trend: 'up',
        icon: Icons.inventory,
        color: const Color(0xFF8B5CF6),
      ),
      StatData(
        title: 'Users',
        value: '2,845',
        change: '+8.2%',
        trend: 'up',
        icon: Icons.people,
        color: const Color(0xFFF59E0B),
      ),
    ];
  }
}
