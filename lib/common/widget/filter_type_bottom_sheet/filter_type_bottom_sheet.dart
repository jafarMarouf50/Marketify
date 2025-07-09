part of '../../index.dart';

class FilterTypeBottomSheet extends StatelessWidget {
  final String label;
  final String currentValue;

  const FilterTypeBottomSheet({
    super.key,
    required this.label,
    required this.currentValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _header(context, label),
          const SizedBox(height: 40),
          _buildBottomSheetContent(label, currentValue),
        ],
      ),
    );
  }

  Widget _buildBottomSheetContent(String filterType, String currentValue) {
    switch (filterType) {
      case 'Sort by':
        return ReusableOptionBottomSheet(
          initialValue: currentValue,
          options: [
            'All',
            'Recommended',
            'Newest',
            'Lowest-Highest Price',
            'Highest-Lowest Price',
          ],
        );

      case 'Price':
        return ReusableOptionBottomSheet(
          initialValue: currentValue,
          options: ['Min', 'Max'],
        );
      case 'On Sale':
        return ReusableOptionBottomSheet(
          initialValue: currentValue,
          options: ['On Sale', 'Free Shipping Eligible'],
        );
      case 'Gender':
        return ReusableOptionBottomSheet(
          initialValue: currentValue,
          options: ['Men', 'Women', 'Kids'],
        );
      default:
        return ReusableOptionBottomSheet(
          initialValue: currentValue,
          options: [
            'All',
            'Recommended',
            'Newest',
            'Lowest-Highest Price',
            'Highest-Lowest Price',
          ],
        );
    }
  }

  Widget _header(BuildContext context, String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Clear', style: TextStyle(color: Colors.white70)),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close, color: Colors.white70),
        ),
      ],
    );
  }
}
