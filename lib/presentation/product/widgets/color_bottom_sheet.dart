part of '../index.dart';

class ColorBottomSheet extends StatelessWidget {
  const ColorBottomSheet({
    super.key,
    required this.colors,
    required this.currentValue,
  });

  final List<ProductColorEntity> colors;
  final String currentValue;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OptionSelectCubit(currentValue),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _headerBottomSheet(context, "Color"),
            const SizedBox(height: 40),
            ColorContentBottomSheet(colors: colors),
          ],
        ),
      ),
      // child: BuildBottomSheetContentBody(colors: colors),
    );
  }

  Widget _headerBottomSheet(BuildContext context, String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Clear', style: TextStyle(color: Colors.white70)),
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.close, color: Colors.white70),
        ),
      ],
    );
  }
}

class ColorContentBottomSheet extends StatelessWidget {
  const ColorContentBottomSheet({super.key, required this.colors});

  final List<ProductColorEntity> colors;

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<OptionSelectCubit>().state;
    final cubit = context.read<OptionSelectCubit>();
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 4,
      child: ListView.builder(
        itemCount: colors.length,
        itemBuilder: (context, index) {
          bool isSelected = selected == colors[index].title;
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            height: 56,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context, colors[index].title);
                cubit.select(colors[index].title);
                context.read<ColorSelectionCubit>().itemSelection(
                  colors.indexOf(colors[index]),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? const Color(0xFF7C4DFF)
                      : const Color(0xFF3A3A3A),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      colors[index].title,
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
        },
      ),
    );
  }
}
