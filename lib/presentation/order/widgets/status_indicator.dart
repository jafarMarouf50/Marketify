part of '../index.dart';

class StatusIndicator extends StatelessWidget {
  final bool isCompleted;
  final bool isActive;

  const StatusIndicator({
    super.key,
    required this.isCompleted,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: isCompleted
                ? AppColorsDark.primary
                : AppColorsDark.statusIndicator,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check),
        ),
        Expanded(
          child: Container(
            width: 2,
            color: isCompleted
                ? AppColorsDark.primary
                : AppColorsDark.statusIndicator,
          ),
        ),
      ],
    );
  }
}
