part of '../index.dart';

class BuildSortByBottomSheet extends StatefulWidget {
  final String currentValue;

  const BuildSortByBottomSheet({super.key, required this.currentValue});

  @override
  State<BuildSortByBottomSheet> createState() => _BuildSortByBottomSheetState();
}

class _BuildSortByBottomSheetState extends State<BuildSortByBottomSheet> {
  late String selectedSort;

  @override
  void initState() {
    super.initState();
    selectedSort = widget.currentValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildBottomSheetOption("All", selectedSort, (value) {
          setState(() {
            selectedSort = value;
          });
          Navigator.pop(context, value); // Return selected value
        }),

        buildBottomSheetOption("Recommended", selectedSort, (value) {
          setState(() {
            selectedSort = value;
          });
          Navigator.pop(context, value); // Return selected value
        }),
        buildBottomSheetOption("Newest", selectedSort, (value) {
          setState(() {
            selectedSort = value;
          });
          Navigator.pop(context, value); // Return selected value
        }),
        buildBottomSheetOption("Lowest-Highest Price", selectedSort, (value) {
          setState(() {
            selectedSort = value;
          });
          Navigator.pop(context, value); // Return selected value
        }),
        buildBottomSheetOption("Highest-Lowest Price", selectedSort, (value) {
          setState(() {
            selectedSort = value;
          });
          Navigator.pop(context, value); // Return selected value
        }),
      ],
    );
  }
}
