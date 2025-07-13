part of '../index.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicHomeAppbar(
        actionsPadding: EdgeInsets.only(right: 24),
        action: GestureDetector(
          onTap: () {},
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColorsDark.container,
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: SvgPicture.asset(
                AppImages.vectorsHeart,
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
              ),
            ),
          ),
        ),
      ),
      body: ProductDetailsViewBody(product: product),
    );
  }
}
