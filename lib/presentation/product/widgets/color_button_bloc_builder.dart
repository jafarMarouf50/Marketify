part of '../index.dart';

class ColorButtonBlocBuilder extends StatelessWidget {
  const ColorButtonBlocBuilder({super.key, required this.colors});

  final List<ProductColorEntity> colors;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ColorSelectionCubit, int>(
      builder: (context, state) {
        final cubit = context.read<ColorSelectionCubit>();
        final selectedIndex = cubit.selectedIndex;
        final currentValue =
            selectedIndex != -1 && selectedIndex < colors.length
            ? colors[selectedIndex].title
            : 'White';

        return AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          child: BasicAppButton(
            onPressed: () async {
              await AppBottomSheet.display(
                context,
                BlocProvider.value(
                  value: context.read<ColorSelectionCubit>(),
                  child: ColorBottomSheet(
                    colors: colors,
                    currentValue: currentValue,
                  ),
                ),
              );
            },
            backgroundColor: cubit.selectedIndex != -1
                ? AppColorsDark.primary
                : AppColorsDark.container,
            content: _buildColor(context, selectedIndex),
          ),
        );
      },
    );
  }

  Widget _buildColor(BuildContext context, int selectIndex) {
    return Row(
      children: [
        Text(
          "Color",
          style: AppStyles.styleBold16(context).copyWith(color: Colors.white),
        ),
        Spacer(),
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: selectIndex == -1
                ? Colors.white
                : Color.fromARGB(
                    255,
                    colors[selectIndex].rgb[0],
                    colors[selectIndex].rgb[1],
                    colors[selectIndex].rgb[2],
                  ),
          ),
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
