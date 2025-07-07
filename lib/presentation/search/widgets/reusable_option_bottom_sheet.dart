part of '../index.dart';

class ReusableOptionBottomSheet extends StatelessWidget {
  final List<String> options;
  final String initialValue;

  const ReusableOptionBottomSheet({
    super.key,
    required this.options,
    required this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OptionSelectCubit(initialValue),
      child: const OptionSelectorView(),
    );
  }
}
