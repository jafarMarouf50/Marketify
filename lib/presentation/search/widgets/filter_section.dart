part of '../index.dart';

class FilterSection extends StatefulWidget {
  const FilterSection({super.key});

  @override
  State<FilterSection> createState() => _FilterSectionState();
}

class _FilterSectionState extends State<FilterSection> {
  Set<int> selectedIndices = {0};

  Map<String, String> selectedValues = {
    'On Sale': 'On Sale',
    'Price': 'Price',
    'Sort by': 'Sort by',
    'Gender': 'Gender',
  };

  final List<FilterOption> _filters = [
    FilterOption(label: 'On Sale'),
    FilterOption(label: 'Price'),
    FilterOption(label: 'Sort by'),
    FilterOption(label: 'Gender'),
  ];

  void _toggleTab(int index) async {
    final result = await AppBottomSheet.display<String>(
      context,
      FilterTypeBottomSheet(
        label: _filters[index].label,
        currentValue:
            selectedValues[_filters[index].label] ?? _filters[index].label,
      ),
    );

    if (result != null) {
      setState(() {
        selectedValues[_filters[index].label] = result;
        selectedIndices.add(index);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Container(
            margin: index == 0
                ? const EdgeInsets.only(left: 24)
                : index == _filters.length - 1
                ? const EdgeInsets.only(left: 8, right: 24)
                : const EdgeInsets.only(left: 8),
            child: FilterChip(
              filter: FilterOption(
                label: _getDisplayLabel(_filters[index].label),
              ),
              isSelected: selectedIndices.contains(index),
              onTap: () => _toggleTab(index),
            ),
          );
        },
        itemCount: _filters.length,
      ),
    );
  }

  String _getDisplayLabel(String originalLabel) {
    String selectedValue = selectedValues[originalLabel] ?? originalLabel;

    switch (originalLabel) {
      case 'On Sale':
        return selectedValue == 'On Sale' ? 'On Sale' : selectedValue;
      case 'Price':
        return selectedValue == 'Price' ? 'Price' : selectedValue;
      case 'Sort by':
        return selectedValue == 'Sort by' ? 'Sort by' : selectedValue;
      case 'Gender':
        return selectedValue == 'Gender' ? 'Gender' : selectedValue;
      default:
        return selectedValue;
    }
  }
}
