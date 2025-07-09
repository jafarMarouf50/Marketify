part of '../index.dart';

class OrderItemsCard extends StatelessWidget {
  const OrderItemsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 23, top: 16, bottom: 16, right: 21),
      decoration: BoxDecoration(
        color: AppColorsDark.container,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const OrderIcon(),
          const SizedBox(width: 23.5),
          const Expanded(
            child: Text(
              '4 Items',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'View All',
              style: AppStyles.styleBold12(
                context,
              ).copyWith(color: AppColorsDark.primary),
            ),
          ),
        ],
      ),
    );
  }
}
