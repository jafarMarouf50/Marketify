part of '../index.dart';

class Categories extends StatelessWidget {
  final List<CategoryEntity> categories;

  const Categories({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Column(children: [_seeAll(context), _categories()]);
  }

  Widget _seeAll(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Categories", style: AppStyles.styleBold18(context)),
          GestureDetector(
            onTap: () {
              AppNavigator.push(
                context,
                AllCategoriesView(categories: categories),
              );
            },
            child: Text("See All", style: AppStyles.styleRegular16(context)),
          ),
        ],
      ),
    );
  }

  Widget _categories() {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: (categories.length - 1 != index)
                ? const EdgeInsets.only(left: 16)
                : const EdgeInsets.only(left: 16, right: 16),
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(categories[index].image),
                      ),
                    ),
                  ),
                ),
                Text(
                  categories[index].title,
                  style: AppStyles.styleRegular14(context),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
