part of '../index.dart';

class AgeSelection extends StatelessWidget {
  const AgeSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final boxDecorationTheme = Theme.of(
      context,
    ).extension<BoxDecorationTheme>();
    final cubit = context.read<AgeSelectionCubit>();
    final selectedAge = context.watch<AgeSelectionCubit>().state;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {
          AppBottomSheet.display(
            context,
            MultiBlocProvider(
              providers: [
                BlocProvider.value(value: context.read<AgeSelectionCubit>()),
                BlocProvider.value(
                  value: context.read<GetAgesCubit>()..getAges(),
                ),
              ],
              child: Ages(),
            ),
          );
        },

        // Match container's border radius
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: boxDecorationTheme?.card,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                cubit.selectedAge,
                style: AppStyles.styleRegular16(context).copyWith(
                  color: selectedAge == cubit.selectedAge
                      ? AppColorsDark.text
                      : AppColorsDark.hintText,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: cubit.selectedAge.isNotEmpty
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).hintColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
