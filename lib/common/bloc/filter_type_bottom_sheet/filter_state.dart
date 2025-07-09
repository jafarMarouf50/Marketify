part of '../../index.dart';

class FilterState {
  final Map<String, String> selectedValues;
  final Set<int> selectedIndices;

  FilterState({required this.selectedValues, required this.selectedIndices});

  FilterState copyWith({
    Map<String, String>? selectedValues,
    Set<int>? selectedIndices,
  }) {
    return FilterState(
      selectedValues: selectedValues ?? this.selectedValues,
      selectedIndices: selectedIndices ?? this.selectedIndices,
    );
  }
}
