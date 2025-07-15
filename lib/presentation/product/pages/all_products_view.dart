part of '../index.dart';

class AllProductsView extends StatelessWidget {
  final List<ProductEntity> products;

  const AllProductsView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(bottom: 23),
                child: _hoodies(context),
              ),
            ),
            ProductsGridView(products: products),
            SliverToBoxAdapter(child: SizedBox(height: 34)),
          ],
        ),
      ),
    );
  }

  Widget _hoodies(BuildContext context) {
    return Text('Hoodies (240)', style: AppStyles.styleBold24(context));
  }
}
