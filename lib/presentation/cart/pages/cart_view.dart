part of '../index.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(title: Text('Cart')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          // child:
        ),
      ),
    );
  }
}

// EmptyScreen(
// subtitle: "Your Cart is Empty",
// image: SvgPicture.asset(AppImages.vectorsCartBag),
// onPressed: () {},
// buttonTitle: 'Explore Categories',
// ),
