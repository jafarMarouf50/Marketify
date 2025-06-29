part of '../index.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Map<String, String>> categories = [
    {"title": "Hoodies", "image": AppImages.imagesHoodies},
    {"title": "Jackets", "image": AppImages.imagesHoodies},
    {"title": "T-Shirts", "image": AppImages.imagesHoodies},
    {"title": "Pants", "image": AppImages.imagesHoodies},
    {"title": "Hats", "image": AppImages.imagesHoodies},
    {"title": "Accessories", "image": AppImages.imagesHoodies},
  ];

  final List<Map<String, dynamic>> products = [
    {
      "title": "Men's Harrington Jacket",
      "price": 148.00,
      "oldPrice": null,
      "image": AppImages.imagesFleeceSkateHoodie,
    },
    {
      "title": "Max Cirro Men's Slides",
      "price": 55.00,
      "oldPrice": 100.97,
      "image": AppImages.imagesFleecePulloverHoodie,
    },
    {
      "title": "Men's Harrington Jacket",
      "price": 148.00,
      "oldPrice": null,
      "image": AppImages.imagesFleeceSkateHoodie,
    },
    {
      "title": "Max Cirro Men's Slides",
      "price": 55.00,
      "oldPrice": 100.97,
      "image": AppImages.imagesFleecePulloverHoodie,
    },
    {
      "title": "Men's Harrington Jacket",
      "price": 148.00,
      "oldPrice": null,
      "image": AppImages.imagesFleeceSkateHoodie,
    },
    {
      "title": "Max Cirro Men's Slides",
      "price": 55.00,
      "oldPrice": 100.97,
      "image": AppImages.imagesFleecePulloverHoodie,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                const Header(),
                const SizedBox(height: 24),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.0),
                  child: SearchFiled(),
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
    );
  }
}
