part of '../index.dart';

class SizeBottomSheet extends StatelessWidget {
  const SizeBottomSheet({
    super.key,
    required this.sizes,
    required this.currentValue,
  });

  final List<String> sizes;
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
            _headerBottomSheet(context, "Size"),
            const SizedBox(height: 40),
            SizeContentBottomSheet(sizes: sizes),
          ],
        ),
      ),
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

class SizeContentBottomSheet extends StatelessWidget {
  const SizeContentBottomSheet({super.key, required this.sizes});

  final List<String> sizes;

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<OptionSelectCubit>().state;
    final cubit = context.read<OptionSelectCubit>();
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 3,
      child: ListView.builder(
        itemCount: sizes.length,
        itemBuilder: (context, index) {
          bool isSelected = selected == sizes[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 8),
            height: 56,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context, sizes[index]);
                cubit.select(sizes[index]);
                context.read<SizeSelectionCubit>().itemSelection(
                  sizes.indexOf(sizes[index]),
                );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? AppColorsDark.primary
                      : AppColorsDark.container,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      sizes[index],
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
