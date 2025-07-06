part of '../index.dart';

class CategoriesCardList extends StatelessWidget {
  const CategoriesCardList({super.key, required this.categories});

  final List<CategoryEntity> categories;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: categories.length,
      itemBuilder: (context, index) =>
          CategoryCard(category: categories[index]),
      separatorBuilder: (context, index) => SizedBox(height: 8),
    );
  }
}
