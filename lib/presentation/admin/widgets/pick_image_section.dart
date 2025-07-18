part of '../index.dart';

class PickImageSection extends StatelessWidget {
  final ImageListManager imageListManager;

  const PickImageSection({super.key, required this.imageListManager});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageManagerCubit, ImageManagerState>(
      builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              GestureDetector(
                onTap: state.isLoading
                    ? null
                    : () => showImageSourceDialog(context),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: const Color(0xFF334155),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: const Color(0xFF64748B),
                      style: BorderStyle.solid,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: state.isLoading
                        ? const CircularProgressIndicator(color: Colors.white70)
                        : const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_photo_alternate,
                                color: Colors.white70,
                                size: 40,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Add Images',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),

              if (state.images.isNotEmpty) ...[
                const SizedBox(height: 16),
                SizedBox(
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.images.length,
                    itemBuilder: (context, index) {
                      final image = state.images[index];
                      return Container(
                        width: 80,
                        height: 80,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          color: const Color(0xFF334155),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                image,
                                width: 80,
                                height: 80,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: -2,
                              right: -2,
                              child: GestureDetector(
                                onTap: () => context
                                    .read<ImageManagerCubit>()
                                    .removeAt(index),

                                child: Container(
                                  width: 20,
                                  height: 20,
                                  decoration: const BoxDecoration(
                                    color: Color(0xFFEF4444),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
