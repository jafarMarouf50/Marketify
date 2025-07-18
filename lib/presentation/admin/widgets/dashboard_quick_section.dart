part of '../index.dart';

class DashboardQuickSection extends StatelessWidget {
  const DashboardQuickSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.1,
      ),
      delegate: SliverChildListDelegate([
        _buildQuickActionButton(
          icon: Icons.category,
          label: 'Add Category',
          color: const Color(0xFF06B6D4),
          onTap: () {
            AppNavigator.push(context, const AddCategoryView());

          },
        ),
        _buildQuickActionButton(
          icon: Icons.add,
          label: 'Add Product',
          color: const Color(0xFF3B82F6),
          onTap: () {
            AppNavigator.push(context, const AddProductView());
          },
        ),
        _buildQuickActionButton(
          icon: Icons.shopping_cart,
          label: 'New Order',
          color: const Color(0xFF10B981),
          onTap: () {
            // Handle new order
          },
        ),
        _buildQuickActionButton(
          icon: Icons.people,
          label: 'View Users',
          color: const Color(0xFF8B5CF6),
          onTap: () {
            // Handle view users
          },
        ),
        _buildQuickActionButton(
          icon: Icons.analytics,
          label: 'Analytics',
          color: const Color(0xFFF59E0B),
          onTap: () {
            // Handle analytics
          },
        ),
        _buildQuickActionButton(
          icon: Icons.inventory,
          label: 'Inventory',
          color: const Color(0xFFEF4444),
          onTap: () {
            // Handle inventory
          },
        ),
        _buildQuickActionButton(
          icon: Icons.settings,
          label: 'Settings',
          color: const Color(0xFF6B7280),
          onTap: () {
            // Handle settings
          },
        ),

        _buildQuickActionButton(
          icon: Icons.notifications,
          label: 'Notifications',
          color: const Color(0xFFEC4899),
          onTap: () {
            // Handle notifications
          },
        ),
        _buildQuickActionButton(
          icon: Icons.receipt,
          label: 'Reports',
          color: const Color(0xFF84CC16),
          onTap: () {
            // Handle reports
          },
        ),
      ]),
    );
  }

  Widget _buildQuickActionButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        // padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 24),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
