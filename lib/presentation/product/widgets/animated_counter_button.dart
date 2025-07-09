part of '../index.dart';

class AnimatedCounterButton extends StatefulWidget {
  final String label;
  final VoidCallback? onTap;
  final Color backgroundColor;
  final TextStyle? textStyle;

  const AnimatedCounterButton({
    super.key,
    required this.label,
    this.onTap,
    this.backgroundColor = const Color(0xFF6750A4),
    this.textStyle,
  });

  @override
  State<AnimatedCounterButton> createState() => _AnimatedCounterButtonState();
}

class _AnimatedCounterButtonState extends State<AnimatedCounterButton>
    with SingleTickerProviderStateMixin {
  double _scale = 1.0;

  void _animateTap() async {
    setState(() => _scale = 0.85);
    await Future.delayed(const Duration(milliseconds: 80));
    setState(() => _scale = 1.0);
    widget.onTap?.call();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _animateTap,
      child: AnimatedScale(
        scale: _scale,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeOut,
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColorsDark.primary,
          ),
          child: Center(
            child: Text(
              widget.label,
              style: AppStyles.styleBold20(
                context,
              ).copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
