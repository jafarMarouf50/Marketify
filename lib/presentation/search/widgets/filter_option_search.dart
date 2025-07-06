part of '../index.dart';

class FilterOptionSearch extends StatefulWidget {
  const FilterOptionSearch({super.key, required this.title});

  final String title;

  @override
  State<FilterOptionSearch> createState() => _FilterOptionSearchState();
}

class _FilterOptionSearchState extends State<FilterOptionSearch> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectFilterByTypeCubit, String>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.only(bottom: 8),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  isSelected = !isSelected;
                });
              },
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
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
                      widget.title,
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
      },
    );
  }
}
