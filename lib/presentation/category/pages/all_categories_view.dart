part of '../index.dart';

class AllCategoriesView extends StatelessWidget {
  final List<Map<String, dynamic>> categories;

  const AllCategoriesView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomScrollView(
          slivers: [BasicAppbar(), _shopByCategories(context), _categories()],
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

  Widget _categories() {
    return SliverList.separated(
      itemCount: 6,
      itemBuilder: (context, index) =>
          _categoryCard(category: categories[index]),
      separatorBuilder: (context, index) => SizedBox(height: 8),
    );
  }

  Widget _categoryCard({required final Map<String, dynamic> category}) {
    return Container(
      height: 70,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColorsDark.secondBackground,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(category['image']),
              ),
            ),
          ),

          const SizedBox(width: 15),
          Text(
            category['title'],
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
