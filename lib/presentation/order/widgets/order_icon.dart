part of '../index.dart';

class OrderIcon extends StatelessWidget {
  const OrderIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: SvgPicture.asset(
        AppImages.vectorsReceipt,
        colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }
}
