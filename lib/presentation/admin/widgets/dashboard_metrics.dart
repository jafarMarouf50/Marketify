part of '../index.dart';

class DashboardMetrics extends StatelessWidget {
  const DashboardMetrics({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      childAspectRatio: 1.2,
      children: const [
        MetricItem(
          icon: Icons.accessibility,
          label: 'Total Revenue',
          value: '\$45,231.89',
          growth: '+20.1%',
          color: Colors.green,
        ),
        MetricItem(
          icon: Icons.accessibility,
          // icon: FontAwesomeIcons.shoppingCart,
          label: 'Orders',
          value: '1,234',
          growth: '+12.3%',
          color: Colors.blue,
        ),
        MetricItem(
          icon: Icons.accessibility,
          // icon: FontAwesomeIcons.box,
          label: 'Products',
          value: '568',
          growth: '+5.4%',
          color: Colors.purple,
        ),
        MetricItem(
          // icon: FontAwesomeIcons.user,
          icon: Icons.accessibility,
          label: 'Users',
          value: '2,845',
          growth: '+8.2%',
          color: Colors.orange,
        ),
      ],
    );
  }
}
