part of '../index.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Header(),
                  SizedBox(height: 24),
                  SearchFiled(),
                  SizedBox(height: 24),
                  Categories(),
                  SizedBox(height: 24),
                  TopSelling(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
