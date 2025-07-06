part of '../index.dart';

class BuildGenderBottomSheet extends StatefulWidget {
  final String currentValue;

  const BuildGenderBottomSheet({super.key, required this.currentValue});

  @override
  State<BuildGenderBottomSheet> createState() => _BuildGenderBottomSheetState();
}

class _BuildGenderBottomSheetState extends State<BuildGenderBottomSheet> {
  late String selectedGender;

  @override
  void initState() {
    super.initState();
    selectedGender = widget.currentValue;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildBottomSheetOption("All", selectedGender, (value) {
          setState(() {
            selectedGender = value;
          });
          Navigator.pop(context, value); // Return selected value
        }),
        buildBottomSheetOption("Men", selectedGender, (value) {
          setState(() {
            selectedGender = value;
          });
          Navigator.pop(context, value); // Return selected value
        }),
        buildBottomSheetOption("Women", selectedGender, (value) {
          setState(() {
            selectedGender = value;
          });
          Navigator.pop(context, value); // Return selected value
        }),
        buildBottomSheetOption("Kids", selectedGender, (value) {
          setState(() {
            selectedGender = value;
          });
          Navigator.pop(context, value); // Return selected value
        }),
      ],
    );
  }
}
