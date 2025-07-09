part of '../index.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Stack(
          children: [
            _buildScrollView(),
            AddToBagButton(price: product.price),
          ],
        ),
      ),
    );
  }

  Widget _buildScrollView() {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: ProductImages(images: product.imageUrls)),
        SliverToBoxAdapter(child: ProductInfo(product: product)),
        SliverToBoxAdapter(child: ProductOptions(product: product)),
        const SliverToBoxAdapter(child: ProductTextSection()),
        const SliverPadding(
          padding: EdgeInsets.only(bottom: 140),
          sliver: SliverToBoxAdapter(child: ProductReviews()),
        ),
      ],
    );
  }
}
