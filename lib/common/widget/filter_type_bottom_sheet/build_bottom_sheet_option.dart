part of '../../index.dart';

class BuildBottomSheetOption extends StatelessWidget {
  const BuildBottomSheetOption({
    super.key,
    required this.title,
    required this.onTap,
    required this.selectedValue,
  });

  final String title;
  final String selectedValue;
  final Function(String) onTap;

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedValue == title;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      height: 56,
      child: InkWell(
        onTap: () => onTap(title),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: isSelected ? AppColorsDark.primary : AppColorsDark.container,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (isSelected)
                const Icon(Icons.check, color: Colors.white, size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
