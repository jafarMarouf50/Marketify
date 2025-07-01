part of '../index.dart';

class ShippingDetailsCard extends StatelessWidget {
  const ShippingDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(11),
      decoration: BoxDecoration(
        color: AppColorsDark.container,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '2716 Ash Dr, San Jose, South Dakota 83475',
            style: TextStyle(
              color: Colors.grey.shade300,
              fontSize: 16,
              height: 1.4,
            ),
            maxLines: 2,
          ),
          const SizedBox(height: 8),
          Text(
            '01-264-7890',
            style: TextStyle(color: Colors.grey.shade300, fontSize: 16),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
