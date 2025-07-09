part of '../../index.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit()
    : super(
        FilterState(
          selectedValues: {
            'On Sale': 'On Sale',
            'Price': 'Price',
            'Sort by': 'Sort by',
            'Gender': 'Gender',
          },
          selectedIndices: {0},
        ),
      );

  void updateFilter(int index, String label, String value) {
    final updatedValues = Map<String, String>.from(state.selectedValues);
    final updatedIndices = Set<int>.from(state.selectedIndices);

    updatedValues[label] = value;
    updatedIndices.add(index);

    emit(
      state.copyWith(
        selectedValues: updatedValues,
        selectedIndices: updatedIndices,
      ),
    );
  }
}
