part of '../index.dart';

class ProductImages extends StatefulWidget {
  const ProductImages({super.key, required this.images});

  final List<String> images;

  @override
  State<ProductImages> createState() => _ProductImagesState();
}

class _ProductImagesState extends State<ProductImages> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildProductImageList(),
        const SizedBox(height: 16),
        _buildSmoothPageIndicator(),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildProductImageList() {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35,
      child: PageView.builder(
        controller: _controller,
        itemCount: widget.images.length,
        itemBuilder: (_, index) => AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            num value = 1.0;
            if (_controller.position.haveDimensions) {
              value = (_controller.page ?? _controller.initialPage) - index;
              value = (1 - (value.abs() * 0.3)).clamp(0.85, 1.0);
            }
            return Transform.scale(
              scale: value.toDouble(),
              child: Opacity(opacity: value.toDouble(), child: child),
            );
          },
          child: Image.asset(widget.images[index], fit: BoxFit.fitHeight),
        ),
      ),
    );
  }

  Widget _buildSmoothPageIndicator() {
    return SmoothPageIndicator(
      controller: _controller,
      count: widget.images.length,
      effect: const WormEffect(
        activeDotColor: Colors.purpleAccent,
        dotColor: Colors.white24,
        dotHeight: 8,
        dotWidth: 8,
      ),
    );
  }
}
