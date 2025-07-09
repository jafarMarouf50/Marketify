part of '../index.dart';

class ProductOptions extends StatelessWidget {
  const ProductOptions({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocProvider(
          create: (_) => SizeSelectionCubit(),
          child: SizeButtonBlocBuilder(sizes: product.sizes),
        ),
        SizedBox(height: 12),
        BlocProvider(
          create: (_) => ColorSelectionCubit(),
          child: ColorButtonBlocBuilder(colors: product.colors),
        ),
        SizedBox(height: 12),
        BlocProvider(create: (_) => QuantityCubit(), child: QuantityButton()),
        SizedBox(height: 26),
      ],
    );
  }
}
