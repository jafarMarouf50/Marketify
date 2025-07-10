part of '../index.dart';

class PasswordStrengthIndicator extends StatefulWidget {
  final PasswordStrength strength;

  const PasswordStrengthIndicator({super.key, required this.strength});

  @override
  State<PasswordStrengthIndicator> createState() =>
      _PasswordStrengthIndicatorState();
}

class _PasswordStrengthIndicatorState extends State<PasswordStrengthIndicator>
    with TickerProviderStateMixin {
  late AnimationController _mainController;

  late Animation<double> _progressAnimation;
  late Animation<double> _opacityAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();

    _mainController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _initializeAnimations();
    _mainController.forward();
  }

  void _initializeAnimations() {
    final strength = widget.strength;

    _progressAnimation = Tween<double>(begin: 0.0, end: strength.value).animate(
      CurvedAnimation(parent: _mainController, curve: Curves.easeInOutCubic),
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _mainController, curve: Curves.easeIn));

    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _mainController, curve: Curves.elasticOut),
    );

    _colorAnimation =
        ColorTween(begin: Colors.grey.shade300, end: strength.color).animate(
          CurvedAnimation(parent: _mainController, curve: Curves.easeInOut),
        );
  }

  @override
  void didUpdateWidget(covariant PasswordStrengthIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.strength != widget.strength) {
      _mainController.reset();
      _initializeAnimations();
      _mainController.forward();
    }
  }

  @override
  void dispose() {
    _mainController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _mainController,
      builder: (context, child) {
        return Semantics(
          label: 'Password strength: ${widget.strength.label}',
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Progress bar
              Transform.scale(
                scale: _scaleAnimation.value,
                child: Container(
                  height: 8,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Stack(
                    children: [
                      // Background shadow
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: widget.strength != PasswordStrength.none
                              ? [
                                  BoxShadow(
                                    color:
                                        (_colorAnimation.value ?? Colors.grey),
                                    blurRadius: 6,
                                    spreadRadius: 1,
                                  ),
                                ]
                              : null,
                        ),
                      ),
                      FractionallySizedBox(
                        alignment: Alignment.centerLeft,
                        widthFactor: _progressAnimation.value,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            gradient: widget.strength != PasswordStrength.none
                                ? LinearGradient(
                                    colors: [
                                      (_colorAnimation.value ??
                                          Colors.grey.shade400),
                                      (_colorAnimation.value ??
                                          Colors.grey.shade600),
                                    ],
                                  )
                                : null,
                            color: _colorAnimation.value,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              // Strength label
              AnimatedOpacity(
                opacity: widget.strength == PasswordStrength.none
                    ? 0.0
                    : _opacityAnimation.value,
                duration: const Duration(milliseconds: 300),
                child: Transform.translate(
                  offset: Offset(0, (1 - _opacityAnimation.value) * 10),
                  child: Text(
                    '${widget.strength.emoji} ${widget.strength.label}',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: _colorAnimation.value,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
