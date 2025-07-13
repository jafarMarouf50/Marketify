part of '../../index.dart';

class CustomerBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const CustomerBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const List<NavBarItem> _customerItems = [
    NavBarItem(assetName: AppImages.vectorsHome, label: 'Home'),
    NavBarItem(
      assetName: AppImages.vectorsNotification,
      label: 'Notifications',
    ),
    NavBarItem(assetName: AppImages.vectorsReceipt, label: 'Orders'),
    NavBarItem(assetName: AppImages.vectorsProfile2, label: 'Profile'),
  ];

  @override
  Widget build(BuildContext context) {
    return UnifiedBottomNavBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: _customerItems,
    );
  }
}
