part of '../index.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  List<ProductEntity> get _products => ProductDataRepository.products();

  static const double horizontalPadding = 24.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        actionsPadding: const EdgeInsets.symmetric(
          horizontal: horizontalPadding,
        ),
        action: SizedBox(
          width: MediaQuery.sizeOf(context).width / 1.25,
          child: const SearchFiled(isReadOnly: false),
        ),
      ),
      body: CustomScrollView(slivers: _buildSlivers(context)),
    );
  }

  List<Widget> _buildSlivers(BuildContext context) {
    return [
      const SliverToBoxAdapter(child: SizedBox(height: 16)),
      const SliverToBoxAdapter(child: FilterSection()),
      const SliverToBoxAdapter(child: SizedBox(height: 17)),
      SliverToBoxAdapter(child: _buildResultsHeader(context)),
      const SliverToBoxAdapter(child: SizedBox(height: 16)),
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        sliver: ProductsGridView(products: _products),
      ),
      const SliverToBoxAdapter(child: SizedBox(height: 34)),
    ];
  }

  Widget _buildResultsHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          '${_products.length} Results Found',
          style: AppStyles.styleMedium14(context),
        ),
      ),
    );
  }
}
