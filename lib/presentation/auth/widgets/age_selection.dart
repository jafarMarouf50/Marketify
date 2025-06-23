part of '../index.dart';

class AgeSelection extends StatelessWidget {
  const AgeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final boxDecorationTheme = Theme.of(
      context,
    ).extension<BoxDecorationTheme>();
    final cubit = context.read<AgeSelectionCubit>();
    final List<String> ages = ["age1", "age2", "age3", "age4", "age5", "age6"];

    return BlocBuilder<AgeSelectionCubit, String>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            AppBottomSheet.display(
              context,
              BlocProvider.value(
                value: context.read<AgeSelectionCubit>(),
                child: Ages(ages: ages),
              ),
            );
          },
          child: Container(
            height: 60,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: boxDecorationTheme?.card,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  cubit.selectIndex,
                  style: AppStyles.styleRegular16(context),
                ),
                const Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ),
        );
      },
    );
  }
}
