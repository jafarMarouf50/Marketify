part of '../index.dart';

class BuildOnSaleBottomSheet extends StatefulWidget {
  final String currentValue;

  const BuildOnSaleBottomSheet({super.key, required this.currentValue});

  @override
  State<BuildOnSaleBottomSheet> createState() => _BuildOnSaleBottomSheetState();
}

class _BuildOnSaleBottomSheetState extends State<BuildOnSaleBottomSheet> {
  late String selectedSale;

  @override
  void initState() {
    super.initState();
    selectedSale = widget.currentValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildBottomSheetOption("All", selectedSale, (value) {
          setState(() {
            selectedSale = value;
          });
          Navigator.pop(context, value); // Return selected value
        }),
        buildBottomSheetOption("On Sale", selectedSale, (value) {
          setState(() {
            selectedSale = value;
          });
          Navigator.pop(context, value); // Return selected value
        }),

        buildBottomSheetOption("Free Shipping Eligible", selectedSale, (value) {
          setState(() {
            selectedSale = value;
          });
          Navigator.pop(context, value); // Return selected value
        }),
      ],
    );
  }
}
