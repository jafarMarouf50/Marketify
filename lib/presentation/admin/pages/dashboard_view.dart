part of '../index.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DashboardAppBar(),
      body: const DashboardBody(),
    );
  }
}

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: CustomScrollView(
        slivers: [
          DashboardMetrics(),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('Recent Orders', style: TextStyle(fontSize: 16)),
                  Text('View All', style: TextStyle(color: Colors.blue)),
                ],
              ),
            ),
          ),
          RecentOrdersSection(),
          // SliverAnimatedList(child: RecentOrdersSection()),
        ],
      ),
    );
  }
}

class RecentOrdersSection extends StatelessWidget {
  const RecentOrdersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.list(
      children: [
        const OrderTile(
          orderId: '#1001',
          name: 'John Doe',
          product: 'iPhone 15 Pro',
          time: '2 min ago',
          amount: '\$999',
          status: 'Completed',
        ),
        const OrderTile(
          orderId: '#1001',
          name: 'John Doe',
          product: 'iPhone 15 Pro',
          time: '2 min ago',
          amount: '\$999',
          status: 'Completed',
        ),
        const OrderTile(
          orderId: '#1002',
          name: 'Sarah Smith',
          product: 'Samsung Galaxy',
          time: '5 min ago',
          amount: '\$799',
          status: 'Pending',
        ),
        const OrderTile(
          orderId: '#1003',
          name: 'Mike Johnson',
          product: 'MacBook Pro',
          time: '10 min ago',
          amount: '\$1,299',
          status: 'Processing',
        ),
      ],
    );
  }
}

class OrderTile extends StatelessWidget {
  final String orderId;
  final String name;
  final String product;
  final String time;
  final String amount;
  final String status;

  const OrderTile({
    super.key,
    required this.orderId,
    required this.name,
    required this.product,
    required this.time,
    required this.amount,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final Color statusColor;
    switch (status) {
      case 'Completed':
        statusColor = Colors.green;
        break;
      case 'Pending':
        statusColor = Colors.orange;
        break;
      case 'Processing':
        statusColor = Colors.blue;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColorsDark.container,
          shape: BoxShape.rectangle,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  orderId,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(name),
                Text(product, style: const TextStyle(color: Colors.grey)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  time,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  amount,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 4),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: statusColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    status,
                    style: TextStyle(fontSize: 12, color: statusColor),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
