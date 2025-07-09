part of '../index.dart';

class ProductInfo extends StatelessWidget {
  final ProductEntity product;

  const ProductInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.title, style: AppStyles.styleBold16(context)),
        SizedBox(height: 15),
        Text(
          "\$${product.price}",
          style: AppStyles.styleBold16(
            context,
          ).copyWith(color: AppColorsDark.primary),
        ),
        const SizedBox(height: 33),
      ],
    );
  }
}
