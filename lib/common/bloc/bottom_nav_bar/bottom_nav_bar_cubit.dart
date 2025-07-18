part of '../../index.dart';

class BottomNavBarCubit extends Cubit<int> {
  BottomNavBarCubit() : super(0);
  final PageController pageController = PageController();

  final List<Widget> customerPages = [
    HomeView(),
    NotificationView(),
    OrderView(),
    ProfileView(),
  ];

  final List<Widget> adminPages = [
    DashboardView(),
    OrdersView(),
    ProductsView(),
    ProfileView(),
  ];

  void changeTab(int index) {
    final currentPage = pageController.page?.round() ?? 0;
    if ((index - currentPage).abs() == 1) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      pageController.jumpToPage(index);
    }
    emit(index);
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
