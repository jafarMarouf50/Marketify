part of '../../index.dart';

class DashboardButtonNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;

  const DashboardButtonNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  static const List<NavBarItem> _adminItems = [
    NavBarItem(assetName: AppImages.vectorsProfile2, label: 'Profile'),
    NavBarItem(assetName: AppImages.vectorsNotification, label: 'Orders'),
    NavBarItem(assetName: AppImages.vectorsReceipt, label: 'Products'),
    NavBarItem(assetName: AppImages.vectorsHome, label: 'Dashboard'),
  ];

  @override
  Widget build(BuildContext context) {
    return UnifiedBottomNavBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: _adminItems,
    );
  }
}
