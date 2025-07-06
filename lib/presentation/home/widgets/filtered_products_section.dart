part of '../index.dart';

class FilteredProductsSection extends StatelessWidget {
  final String titleFilter;
  final List<ProductEntity> products;

  const FilteredProductsSection({
    super.key,
    required this.titleFilter,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleFiltered(context),
        SizedBox(height: MediaQuery.of(context).size.height * 0.015),
        _products(),
      ],
    );
  }

  Widget _titleFiltered(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleFilter,
            style: titleFilter != "New In"
                ? AppStyles.styleBold18(context)
                : AppStyles.styleBold18(
                    context,
                  ).copyWith(color: AppColorsDark.primary),
          ),
          GestureDetector(
            onTap: () {
              AppNavigator.push(context, AllProductsView(products: products));
            },
            child: Text("See All", style: AppStyles.styleRegular16(context)),
          ),
        ],
      ),
    );
  }

  Widget _products() {
    return SizedBox(
      height: 300,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: (index == 0)
                ? const EdgeInsets.only(left: 24)
                : (index == products.length - 1)
                ? const EdgeInsets.only(right: 24)
                : EdgeInsets.zero,
            child: ProductCard(product: products[index]),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 16);
        },
      ),
    );
  }
}
