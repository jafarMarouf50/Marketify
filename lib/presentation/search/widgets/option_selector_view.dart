part of '../index.dart';

class OptionSelectorView extends StatelessWidget {
  const OptionSelectorView({super.key});

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<OptionSelectCubit>().state;
    final cubit = context.read<OptionSelectCubit>();
    final options =
        (context.findAncestorWidgetOfExactType<ReusableOptionBottomSheet>()!)
            .options;

    return Column(
      children: options.map((option) {
        return BuildBottomSheetOption(
          title: option,
          selectedValue: selected,
          onTap: (value) {
            cubit.select(value);
            Navigator.pop(context, value);
          },
        );
      }).toList(),
    );
  }
}
