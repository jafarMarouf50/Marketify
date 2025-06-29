part of '../index.dart';

class AllNotifications extends StatelessWidget {
  const AllNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      sliver: SliverList.separated(
        itemCount: 26,
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) => _buildNotificationCard(
          context,
          title:
              'Gilbert, Thank you for shopping with us we have cancelled order #24568.',
          isNew: true,
        ),
      ),
    );
  }

  Widget _buildNotificationCard(
    BuildContext context, {
    required String title,
    bool isNew = false,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: 12, top: 19, bottom: 15, right: 27),
      decoration: BoxDecoration(
        color: AppColorsDark.container,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNotificationIcon(isNew: isNew),
          const SizedBox(width: 24),
          Expanded(
            child: Text(title, style: AppStyles.styleRegular14(context)),
          ),
        ],
      ),
    );
  }

  _buildNotificationIcon({bool isNew = false}) {
    return Stack(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: SvgPicture.asset(
            AppImages.vectorsUnSelectedNotification,
            colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
          ),
        ),
        isNew
            ? Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE91E63),
                    shape: BoxShape.circle,
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}
