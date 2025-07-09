part of '../index.dart';

class SizeButtonBlocBuilder extends StatelessWidget {
  const SizeButtonBlocBuilder({super.key, required this.sizes});

  final List<String> sizes;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SizeSelectionCubit, int>(
      builder: (context, state) {
        final cubit = context.read<SizeSelectionCubit>();
        final selectedIndex = cubit.selectedIndex;
        final currentValue = selectedIndex != -1 && selectedIndex < sizes.length
            ? sizes[selectedIndex]
            : "S";

        return BasicAppButton(
          onPressed: () async {
            await AppBottomSheet.display(
              context,
              BlocProvider.value(
                value: context.read<SizeSelectionCubit>(),
                child: SizeBottomSheet(
                  sizes: sizes,
                  currentValue: currentValue,
                ),
              ),
            );
          },
          backgroundColor: cubit.selectedIndex != -1
              ? AppColorsDark.primary
              : AppColorsDark.container,
          content: _buildSize(context, currentValue),
        );
      },
    );
  }

  Widget _buildSize(BuildContext context, String currentValue) {
    final selectedSize = context.watch<SizeSelectionCubit>().state;
    final cubit = context.read<SizeSelectionCubit>();
    return Row(
      children: [
        Text(
          "Size",
          style: AppStyles.styleBold16(context).copyWith(color: Colors.white),
        ),
        Spacer(),
        Text(
          selectedSize != cubit.selectedIndex ? "S" : currentValue,
          style: AppStyles.styleBold16(context).copyWith(color: Colors.white),
        ),
        SizedBox(width: MediaQuery.sizeOf(context).width / 11.7),
        SvgPicture.asset(
          AppImages.vectorsArrowDown,
          width: 24,
          height: 24,
          colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ],
    );
  }
}
