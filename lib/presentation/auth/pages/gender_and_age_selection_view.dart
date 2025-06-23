part of '../index.dart';

class GenderAndAgeSelectionView extends StatelessWidget {
  const GenderAndAgeSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GenderSelectionCubit()),
        BlocProvider(create: (context) => AgeSelectionCubit()),
      ],
      child: Scaffold(
        appBar: BasicAppbar(hideBack: true),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TitleScreen(title: "Tell us About yourself"),
                  const SizedBox(height: 30),
                  _genders(context),
                  const SizedBox(height: 30),
                  _howOld(context),
                  const SizedBox(height: 30),
                  AgeSelection(),
                ],
              ),
            ),
            const Spacer(),
            _finishButton(context),
          ],
        ),
      ),
    );
  }

  Widget _genders(BuildContext context) {
    return BlocBuilder<GenderSelectionCubit, int>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GenderTile(genderIndex: 1, gender: 'Men'),
            const SizedBox(width: 20),
            GenderTile(genderIndex: 2, gender: 'Women'),
          ],
        );
      },
    );
  }

  Widget _howOld(BuildContext context) {
    return Text("How Old are you?", style: AppStyles.styleMedium16(context));
  }

  Widget _finishButton(BuildContext context) {
    return Container(
      height: 100,
      color: AppColorsDark.secondBackground,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: BasicAppButton(onPressed: () {}, title: "Finish"),
      ),
    );
  }
}
