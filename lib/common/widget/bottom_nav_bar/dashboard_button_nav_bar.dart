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
    NavBarItem(assetName: AppImages.vectorsDashboard, label: 'Dashboard'),
    NavBarItem(assetName: AppImages.vectorsShoppingCart, label: 'Orders'),
    NavBarItem(assetName: AppImages.vectorsPackage, label: 'Products'),
    NavBarItem(assetName: AppImages.vectorsProfile, label: 'Profile'),
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
