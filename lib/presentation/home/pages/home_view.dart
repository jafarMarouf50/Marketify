part of '../index.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<CategoryEntity> categories = CategoryDataRepository.categories();

  final List<ProductEntity> products = ProductDataRepository.products();

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
                  Categories(categories: categories),
                  const SizedBox(height: 24),
                  FilteredProductsSection(
                    titleFilter: 'Top Selling',
                    products: products,
                  ),
                  SizedBox(height: 24),
                  FilteredProductsSection(
                    titleFilter: "New In",
                    products: products,
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
