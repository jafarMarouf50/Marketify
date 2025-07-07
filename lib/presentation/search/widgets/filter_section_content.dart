part of '../index.dart';

class FilterSectionContent extends StatelessWidget {
  const FilterSectionContent({super.key});

  final List<FilterOption> _filters = const [
    FilterOption(label: 'On Sale'),
    FilterOption(label: 'Price'),
    FilterOption(label: 'Sort by'),
    FilterOption(label: 'Gender'),
  ];

  Future<void> _handleTap(BuildContext context, int index, String label) async {
    final cubit = context.read<FilterCubit>();
    final currentValue = cubit.state.selectedValues[label] ?? label;

    final result = await AppBottomSheet.display(
      context,
      FilterTypeBottomSheet(label: label, currentValue: currentValue),
    );

    if (result != null) {
      cubit.updateFilter(index, label, result);
    }
  }

  String _getDisplayLabel(String original, String selected) {
    return selected == original ? original : selected;
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FilterCubit>().state;
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final label = _filters[index].label;
          final selected = state.selectedIndices.contains(index);
          final displayLabel = _getDisplayLabel(
            label,
            state.selectedValues[label] ?? label,
          );

          return Container(
            margin: index == 0
                ? const EdgeInsets.only(left: 24)
                : index == _filters.length - 1
                ? const EdgeInsets.only(left: 8, right: 24)
                : const EdgeInsets.only(left: 8),
            child: FilterChip(
              filter: FilterOption(label: displayLabel),
              isSelected: selected,
              onTap: () => _handleTap(context, index, label),
            ),
          );
        },
        itemCount: _filters.length,
      ),
    );
  }
}
