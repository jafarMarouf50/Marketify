part of '../index.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  List<CategoryEntity> get _categories => CategoryDataRepository.categories();

  List<ProductEntity> get _products => ProductDataRepository.products();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const Header(),
                  const SizedBox(height: 24),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: SearchFiled(
                      onTap: () => AppNavigator.push(context, SearchView()),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Categories(categories: _categories),
                  const SizedBox(height: 24),
                  FilteredProductsSection(
                    titleFilter: 'Top Selling',
                    products: _products,
                  ),
                  SizedBox(height: 24),
                  FilteredProductsSection(
                    titleFilter: "New In",
                    products: _products,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
