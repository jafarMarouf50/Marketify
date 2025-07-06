part of '../index.dart';

class AllCategoriesView extends StatelessWidget {
  final List<CategoryEntity> categories;

  const AllCategoriesView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomScrollView(
          slivers: [
            _shopByCategories(context),
            CategoriesCardList(categories: categories),
          ],
        ),
      ),
    );
  }

  Widget _shopByCategories(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        child: Text(
          'Shop By Categories',
          style: AppStyles.styleBold24(context),
        ),
      ),
    );
  }
}
