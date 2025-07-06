part of '../index.dart';

Widget buildBottomSheetOption(
  String title,
  String selectedValue,
  Function(String) onTap,
) {
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

  // return GestureDetector(
  //   onTap: () => onTap(title),
  //   child: Container(
  //     width: double.infinity,
  //     padding: EdgeInsets.symmetric(vertical: 12),
  //     margin: EdgeInsets.only(bottom: 8),
  //     decoration: BoxDecoration(
  //       color: isSelected
  //           ? Color(0xFF7C4DFF).withOpacity(0.1)
  //           : Colors.transparent,
  //       borderRadius: BorderRadius.circular(8),
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           title,
  //           style: TextStyle(
  //             fontSize: 16,
  //             color: isSelected ? Color(0xFF7C4DFF) : Colors.black87,
  //             fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
  //           ),
  //         ),
  //         if (isSelected) Icon(Icons.check, color: Color(0xFF7C4DFF), size: 20),
  //       ],
  //     ),
  //   ),
  // );
}
