part of '../index.dart';

class SliverOrdersList extends StatefulWidget {
  const SliverOrdersList({super.key});

  @override
  State<SliverOrdersList> createState() => _SliverOrdersListState();
}

class _SliverOrdersListState extends State<SliverOrdersList> {
  final List<OrderEntity> orders = [
    OrderEntity(
      orderNumber: '#456765',
      itemCount: 4,
      orderStatus: [
        OrderStatusEntity(
          title: 'Delivered',
          date: '28 May',
          isCompleted: true,
          isActive: false,
        ),
        OrderStatusEntity(
          title: 'Shipped',
          date: '28 May',
          isCompleted: true,
          isActive: false,
        ),
        OrderStatusEntity(
          title: 'Order Confirmed',
          date: '28 May',
          isCompleted: true,
          isActive: false,
        ),
        OrderStatusEntity(
          title: 'Order Placed',
          date: '28 May',
          isCompleted: false,
          isActive: false,
        ),
      ],
    ),
    OrderEntity(
      orderNumber: '#454569',
      itemCount: 2,
      orderStatus: [
        OrderStatusEntity(
          title: 'Delivered',
          date: '28 May',
          isCompleted: true,
          isActive: false,
        ),
        OrderStatusEntity(
          title: 'Shipped',
          date: '28 May',
          isCompleted: true,
          isActive: false,
        ),
        OrderStatusEntity(
          title: 'Order Confirmed',
          date: '28 May',
          isCompleted: true,
          isActive: false,
        ),
        OrderStatusEntity(
          title: 'Order Placed',
          date: '28 May',
          isCompleted: true,
          isActive: false,
        ),
      ],
    ),
    OrderEntity(
      orderNumber: '#454809',
      itemCount: 1,
      orderStatus: [
        OrderStatusEntity(
          title: 'Delivered',
          date: '28 May',
          isCompleted: true,
          isActive: false,
        ),
        OrderStatusEntity(
          title: 'Shipped',
          date: '28 May',
          isCompleted: true,
          isActive: false,
        ),
        OrderStatusEntity(
          title: 'Order Confirmed',
          date: '28 May',
          isCompleted: true,
          isActive: false,
        ),
        OrderStatusEntity(
          title: 'Order Placed',
          date: '28 May',
          isCompleted: true,
          isActive: false,
        ),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => OrderCard(orderData: orders[index]),
          childCount: orders.length,
        ),
      ),
    );
  }
}
