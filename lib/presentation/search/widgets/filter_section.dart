part of '../index.dart';

class FilterSection extends StatelessWidget {
  const FilterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FilterCubit(),
      child: FilterSectionContent(),
    );
  }
}
