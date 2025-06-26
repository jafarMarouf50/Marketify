part of '../index.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserInfoDisplayCubit()..displayUser(),
      child: BlocBuilder<UserInfoDisplayCubit, UserInfoDisplayState>(
        builder: (context, state) {
          if (state is UserInfoDisplayLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is UserInfoDisplayLoaded) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _profileImage(state.user.image),
                _gender(context, state.user.gender),
                _card(),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget _profileImage(String image) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image != '' ? image : AppImages.imagesProfile),
        ),
        shape: BoxShape.circle,
        color: AppColorsDark.background,
      ),
    );
  }

  Widget _gender(BuildContext context, int gender) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: AppColorsDark.secondBackground,
      ),
      child: Center(
        child: Row(
          children: [
            Text(
              gender == 0 ? "Men" : "Women",
              style: AppStyles.styleBold16(context),
            ),
            SizedBox(width: 4),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
      ),
    );
  }

  Widget _card() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColorsDark.primary,
      ),
      child: SvgPicture.asset(AppImages.vectorsBag, fit: BoxFit.none),
    );
  }
}
