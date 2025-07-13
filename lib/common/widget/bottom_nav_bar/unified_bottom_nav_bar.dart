part of '../../index.dart';

class UnifiedBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final void Function(int) onTap;
  final List<NavBarItem> items;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? containerPadding;

  const UnifiedBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
    this.padding,
    this.margin,
    this.containerPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          padding ??
          const EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 8),
      child: Container(
        margin: margin ?? const EdgeInsets.symmetric(horizontal: 14),
        padding: containerPadding ?? const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            items.length,
            (index) => _buildIcon(index, items[index]),
          ),
        ),
      ),
    );
  }

  Widget _buildIcon(int index, NavBarItem item) {
    final isSelected = index == currentIndex;
    return GestureDetector(
      onTap: () => onTap(index),
      child: AnimatedScale(
        scale: isSelected ? 1.2 : 1.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        child: SvgPicture.asset(
          item.assetName,
          colorFilter: ColorFilter.mode(
            isSelected
                ? AppColors.selectedBtmNavBar
                : AppColors.unSelectedBtmNavBar,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
