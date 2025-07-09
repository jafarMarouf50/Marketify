part of '../../index.dart';

class EmptyScreen extends StatelessWidget {
  final String subtitle;
  final Widget image;
  final VoidCallback onPressed;
  final String buttonTitle;

  const EmptyScreen({
    super.key,
    required this.subtitle,
    required this.image,
    required this.onPressed,
    required this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          image,
          const SizedBox(height: 24),
          Text(subtitle, style: AppStyles.styleBold24(context)),
          const SizedBox(height: 24),
          BasicAppButton(
            onPressed: onPressed,
            title: buttonTitle,
            textStyle: AppStyles.styleRegular16(
              context,
            ).copyWith(color: Colors.white),
            width: MediaQuery.sizeOf(context).width / 2,
            height: 52,
          ),
        ],
      ),
    );
  }
}
