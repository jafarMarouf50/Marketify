part of '../index.dart';

class ProductReviews extends StatelessWidget {
  const ProductReviews({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Reviews",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        const Text("4.5 Ratings", style: TextStyle(color: Colors.white)),
        const SizedBox(height: 4),
        buildReviewItem("Alex Morgan", "Gucci transcends its heritage..."),
        const SizedBox(height: 12),
        buildReviewItem("Alex Morgan", "Gucci transcends its heritage..."),
      ],
    );
  }

  Widget buildReviewItem(String name, String review, [String? avatarPath]) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileImage(),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(review, style: const TextStyle(color: Colors.white70)),
              Row(
                children: List.generate(
                  5,
                  (index) =>
                      const Icon(Icons.star, size: 14, color: Colors.amber),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
