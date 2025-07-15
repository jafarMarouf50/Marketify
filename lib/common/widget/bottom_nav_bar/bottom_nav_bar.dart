part of '../../index.dart';

class BottomNavBar extends StatelessWidget {
  final NavBarType navBarType;

  const BottomNavBar({super.key, this.navBarType = NavBarType.customer});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BottomNavBarCubit(),
      child: BlocBuilder<BottomNavBarCubit, int>(
        builder: (context, currentIndex) {
          final cubit = context.read<BottomNavBarCubit>();
          return Scaffold(
            body: PageView(
              controller: cubit.pageController,
              onPageChanged: (index) => cubit.changeTab(index),
              children: navBarType == NavBarType.customer
                  ? cubit.customerPages
                  : cubit.adminPages,
            ),
            bottomNavigationBar: navBarType == NavBarType.customer
                ? CustomerBottomNavBar(
                    onTap: (index) => cubit.changeTab(index),
                    currentIndex: currentIndex,
                  )
                : DashboardButtonNavBar(
                    onTap: (index) => cubit.changeTab(index),
                    currentIndex: currentIndex,
                  ),
          );
        },
      ),
    );
  }
}
