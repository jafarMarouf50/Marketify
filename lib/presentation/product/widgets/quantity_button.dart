part of '../index.dart';

class QuantityButton extends StatelessWidget {
  const QuantityButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicAppButton(
      backgroundColor: AppColorsDark.container,
      content: _buildQuantity(context),
    );
  }

  Widget _buildQuantity(BuildContext context) {
    var cubit = context.read<QuantityCubit>();
    return Row(
      children: [
        Text(
          "Quantity",
          style: AppStyles.styleBold16(context).copyWith(color: Colors.white),
        ),
        Spacer(),
        Row(
          children: [
            AnimatedCounterButton(
              label: "+",
              onTap: () {
                cubit.increase();
              },
            ),
            SizedBox(width: 23),
            BlocBuilder<QuantityCubit, QuantityState>(
              builder: (context, state) =>
                  _animationCounterText(context, cubit),
            ),
            SizedBox(width: 23),
            AnimatedCounterButton(
              label: "-",
              onTap: () {
                cubit.decrease();
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _animationCounterText(BuildContext context, QuantityCubit cubit) {
    return SizedBox(
      width: 32,
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        transitionBuilder: (child, animation) {
          return FadeTransition(
            opacity: animation,
            child: ScaleTransition(scale: animation, child: child),
          );
        },
        child: Text(
          '${cubit.counter}',
          key: ValueKey<int>(cubit.counter),
          textAlign: TextAlign.center,
          style: AppStyles.styleBold20(context).copyWith(color: Colors.white),
        ),
      ),
    );
  }
}
