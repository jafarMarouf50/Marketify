part of '../index.dart';

class GenderAndAgeSelectionView extends StatelessWidget {
  const GenderAndAgeSelectionView({super.key, required this.userRequest});

  final CreateUserRequest userRequest;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicHomeAppbar(),
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => GenderSelectionCubit()),
          BlocProvider(create: (context) => AgeSelectionCubit()),
          BlocProvider(create: (context) => GetAgesCubit()),
          BlocProvider(create: (context) => ButtonCubit()),
        ],
        child: BlocListener<ButtonCubit, ButtonState>(
          listener: (context, state) {
            if (state is ButtonStateFailure) {
              var snackBar = AppSnackBar.show(
                Text(state.errMsg),
                backgroundColor: AppColors.danger,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
            if (state is ButtonStateSuccess) {
              AppNavigator.pushReplacementAndRemove(
                context,
                const CustomBottomNavBar(),
              );
            }
          },
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 40,
                      ),
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
            ],
          ),
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
    return Text("How Old are you?", style: AppStyles.styleMedium12(context));
  }

  Widget _finishButton(BuildContext context) {
    return Container(
      height: 100,
      color: AppColorsDark.secondary,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Center(
        child: Builder(
          builder: (BuildContext context) {
            return BasicReactiveButton(
              onPressed: () {
                userRequest.gender = context
                    .read<GenderSelectionCubit>()
                    .selectIndex;
                userRequest.age = context.read<AgeSelectionCubit>().selectedAge;

                context.read<ButtonCubit>().execute(
                  usecase: SignupUseCase(),
                  params: userRequest,
                );
              },
              title: "Finish",
            );
          },
        ),
      ),
    );
  }
}
