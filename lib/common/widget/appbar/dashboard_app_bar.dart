part of '../../index.dart';

class DashboardAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DashboardAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      actionsPadding: EdgeInsets.symmetric(horizontal: 16),
      title: const Text('Admin Dashboard'),
      actions: [
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {},
            ),
            Positioned(
              right: 11,
              top: 11,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  '3',
                  style: TextStyle(fontSize: 10, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),

        const CircleAvatar(
          backgroundColor: Colors.blue,
          child: Text('A', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
