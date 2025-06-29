part of '../index.dart';

class AllProductsView extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  const AllProductsView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomScrollView(
          slivers: [
            BasicAppbar(),
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.only(bottom: 23),
                child: _hoodies(context),
              ),
            ),
            _products(products: products),
            SliverToBoxAdapter(child: SizedBox(height: 34)),
          ],
        ),
      ),
    );
  }

  Widget _hoodies(BuildContext context) {
    return Text('Hoodies (240)', style: AppStyles.styleBold24(context));
  }

  Widget _products({required List<Map<String, dynamic>> products}) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 0.63,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => ProductCard(product: products[index]),
        childCount: 6,
      ),
    );
  }
}
