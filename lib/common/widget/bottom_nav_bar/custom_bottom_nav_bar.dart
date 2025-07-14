part of '../../index.dart';

class CustomBottomNavBar extends StatefulWidget {
  final NavBarType navBarType;
  final List<Widget>? customPages;

  const CustomBottomNavBar({
    super.key,
    this.navBarType = NavBarType.customer,
    this.customPages,
  });

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
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final List<Widget> _customerPages = [
    HomeView(),
    NotificationView(),
    OrderView(),
    ProfileView(),
  ];

  final List<Widget> _adminPages = [
    DashboardView(),
    OrdersView(),
    ProductsView(),
    ProfileView(),
  ];

  List<Widget> get _pages {
    if (widget.customPages != null) return widget.customPages!;
    return widget.navBarType == NavBarType.customer
        ? _customerPages
        : _adminPages;
  }

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
      bottomNavigationBar: widget.navBarType == NavBarType.customer
          ? CustomerBottomNavBar(
              onTap: _onTabTapped,
              currentIndex: _currentIndex,
            )
          : DashboardButtonNavBar(
              onTap: _onTabTapped,
              currentIndex: _currentIndex,
            ),
    );
  }
}
