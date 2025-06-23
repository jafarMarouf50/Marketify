part of '../index.dart';

class GenderTile extends StatelessWidget {
  final int genderIndex;
  final String gender;

  const GenderTile({
    super.key,
    required this.genderIndex,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    final boxDecorationTheme = Theme.of(
      context,
    ).extension<BoxDecorationTheme>();

    final cubit = context.read<GenderSelectionCubit>();

    return Expanded(
      child: GestureDetector(
        onTap: () {
          cubit.selectGender(genderIndex);
        },
        child: Container(
          height: 60,
          decoration: genderIndex != cubit.selectIndex
              ? boxDecorationTheme?.card
              : boxDecorationTheme?.card.copyWith(color: AppColorsDark.primary),
          child: Center(
            child: Text(gender, style: AppStyles.styleBold16(context)),
          ),
        ),
      ),
    );
  }
}
