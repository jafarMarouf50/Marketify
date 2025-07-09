part of '../../index.dart';

class EmptyNotificationsAndOrders extends StatelessWidget {
  final String subtitle;
  final String image;
  final VoidCallback onPressed;
  final String buttonTitle;

  const EmptyNotificationsAndOrders({
    super.key,
    required this.subtitle,
    required this.image,
    required this.onPressed,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          const SizedBox(height: 24),
          Text(subtitle, style: AppStyles.styleBold24(context)),
          const SizedBox(height: 24),
          BasicAppButton(
            onPressed: onPressed,
            title: buttonTitle,
            textStyle: AppStyles.styleRegular16(
              context,
            ).copyWith(color: Colors.white),
            width: MediaQuery.sizeOf(context).width / 2,
            height: 52,
          ),
        ],
      ),
    );
  }
}
