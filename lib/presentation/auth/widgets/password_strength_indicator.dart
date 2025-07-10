part of '../index.dart';

class PasswordStrengthIndicator extends StatelessWidget {
  const PasswordStrengthIndicator({super.key});

  double _getStrengthValue(PasswordStrength strength) {
    switch (strength) {
      case PasswordStrength.weak:
        return 0.33;
      case PasswordStrength.medium:
        return 0.66;
      case PasswordStrength.strong:
        return 1.0;
      default:
        return 0.0;
    }
  }

  Color _getStrengthColor(PasswordStrength strength) {
    switch (strength) {
      case PasswordStrength.weak:
        return Colors.red;
      case PasswordStrength.medium:
        return Colors.orange;
      case PasswordStrength.strong:
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  String _getStrengthText(PasswordStrength strength) {
    switch (strength) {
      case PasswordStrength.weak:
        return "Weak";
      case PasswordStrength.medium:
        return "Medium";
      case PasswordStrength.strong:
        return "Strong";
      default:
        return "Enter password";
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordCubit, PasswordState>(
      buildWhen: (prev, curr) =>
          prev.strength != curr.strength ||
          prev.password.isEmpty != curr.password.isEmpty,
      builder: (context, state) {
        final isVisible = state.password.isNotEmpty;
        final strength = state.strength;

        final strengthColor = _getStrengthColor(strength);
        final strengthValue = _getStrengthValue(strength);
        final strengthText = _getStrengthText(strength);

        return AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: isVisible ? 1.0 : 0.0,
          child: Column(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: 6,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: MediaQuery.of(context).size.width * strengthValue,
                    decoration: BoxDecoration(
                      color: strengthColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 2),
              Align(
                alignment: Alignment.centerRight,
                child: AnimatedDefaultTextStyle(
                  duration: const Duration(milliseconds: 300),
                  style: TextStyle(
                    color: strengthColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  child: Text(strengthText),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
