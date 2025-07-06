part of '../index.dart';

class BuildPriceBottomSheet extends StatefulWidget {
  final String currentValue;

  const BuildPriceBottomSheet({super.key, required this.currentValue});

  @override
  State<BuildPriceBottomSheet> createState() => _BuildPriceBottomSheetState();
}

class _BuildPriceBottomSheetState extends State<BuildPriceBottomSheet> {
  late String selectedPrice;

  @override
  void initState() {
    super.initState();
    selectedPrice = widget.currentValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildBottomSheetOption("All", selectedPrice, (value) {
          setState(() {
            selectedPrice = value;
          });
          Navigator.pop(context, value); // Return selected value
        }),

        buildBottomSheetOption("Min", selectedPrice, (value) {
          setState(() {
            selectedPrice = value;
          });
          Navigator.pop(context, value); // Return selected value
        }),
        buildBottomSheetOption("Max", selectedPrice, (value) {
          setState(() {
            selectedPrice = value;
          });
          Navigator.pop(context, value); // Return selected value
        }),
      ],
    );
  }
}
