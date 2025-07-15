part of '../index.dart';

class PasswordStrengthIndicator extends StatefulWidget {
  const PasswordStrengthIndicator({super.key});

  @override
  State<PasswordStrengthIndicator> createState() =>
      _PasswordStrengthIndicatorState();
}

class _PasswordStrengthIndicatorState extends State<PasswordStrengthIndicator>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _progressAnimation;
  late Animation<Color?> _colorAnimation;

  PasswordStrength _previousStrength = PasswordStrength.none;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
  }

  void _animateToStrength(PasswordStrength newStrength) {
    _controller.reset();

    _progressAnimation = Tween<double>(
      begin: _previousStrength.value,
      end: newStrength.value,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _colorAnimation = ColorTween(
      begin: _previousStrength.color,
      end: newStrength.color,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
    _previousStrength = newStrength;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordStrengthCubit, PasswordStrengthState>(
      builder: (context, state) {
        _animateToStrength(state.strength);

        return AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Progress Bar
                Container(
                  height: 8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Stack(
                    children: [
                      FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: _progressAnimation.value,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: _colorAnimation.value,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // Label
                AnimatedOpacity(
                  opacity: state.strength == PasswordStrength.none ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 300),
                  child: Text(
                    state.strength.label,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: _colorAnimation.value,
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
