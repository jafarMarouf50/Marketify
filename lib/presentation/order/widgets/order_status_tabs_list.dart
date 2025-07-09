part of '../index.dart';

class OrderStatusTabs extends StatefulWidget {
  const OrderStatusTabs({super.key});

  @override
  State<OrderStatusTabs> createState() => _OrderStatusTabsState();
}

class _OrderStatusTabsState extends State<OrderStatusTabs> {
  Set<int> selectedIndices = {0};

  final List<String> tabs = [
    'Processing',
    'Shipped',
    'Delivered',
    'Returned',
    'Cancelled',
  ];

  void _toggleTab(int index) {
    setState(() {
      if (selectedIndices.contains(index)) {
        selectedIndices.remove(index);
      } else {
        selectedIndices.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(left: 24, right: 24, bottom: 24),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          return OrderStatusTab(
            title: tabs[index],
            isSelected: selectedIndices.contains(index),
            onTap: () => _toggleTab(index),
          );
        },
      ),
    );
  }
}
