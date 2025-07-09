part of '../index.dart';

class AddToBagButton extends StatelessWidget {
  final double price;

  const AddToBagButton({super.key, required this.price});

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).padding.bottom;

    return Positioned(
      bottom: 12 + bottomPadding,
      left: 0,
      right: 0,
      child: BasicAppButton(
        height: 52,
        onPressed: () {
          AppNavigator.push(context, const CartView());
        },
        content: Row(
          children: [
            Text(
              '\$$price',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            Text('Add to Bag', style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
