part of '../index.dart';

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
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap(title),
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFF7C4DFF)
                  : const Color(0xFF3A3A3A),
              borderRadius: BorderRadius.circular(12),
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
      ),
    );
  }
}
