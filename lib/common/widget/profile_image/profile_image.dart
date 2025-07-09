part of '../../index.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image ?? AppImages.imagesProfile),
        ),
        shape: BoxShape.circle,
        color: AppColorsDark.background,
      ),
    );
  }
}
