part of '../../index.dart';

class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({super.key});

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  int _currentIndex = 0;
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  void _onTabTapped(int index) {
    setState(() => _currentIndex = index);
    _pageController.animateTo(
      index * MediaQuery.of(context).size.width,
      duration: const Duration(milliseconds: 200),
      curve: Curves.bounceIn,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final _pages = [HomeView(), NotificationView(), ReceiptView(), ProfileView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() => _currentIndex = index);
        },
        children: _pages,
      ),
      bottomNavigationBar: BottomNavBar(
        onTap: _onTabTapped,
        currentIndex: _currentIndex,
      ),
    );
  }
}
