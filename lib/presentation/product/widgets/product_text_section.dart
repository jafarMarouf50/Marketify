part of '../index.dart';

class ProductTextSection extends StatelessWidget {
  const ProductTextSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Built for life and made to last, this full-zip corduroy jacket is part of our Nike Life collection. The spacious fit gives you plenty of room to layer underneath, while the soft corduroy keeps it casual and timeless.",
          style: TextStyle(color: Colors.white70, fontSize: 14, height: 1.5),
        ),
        SizedBox(height: 24),
        _SectionTitle(title: "Shipping & Returns"),
        SizedBox(height: 12),
        Text(
          "Free standard shipping and free 60-day returns.",
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
        SizedBox(height: 24),
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
