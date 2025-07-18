part of '../index.dart';

class BuildHeaderCategory extends StatelessWidget {
  const BuildHeaderCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              // color: AppColorsDark.primary,
              color: const Color(0xFF334155),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.category_outlined,
              size: 48,
              color: AppColorsDark.text,
            ),
          ),
          SizedBox(height: 16),
          Text(
            'Create New Category',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColorsDark.text,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Add a title and image for your category',
            style: TextStyle(fontSize: 14, color: AppColorsDark.hintText),
          ),
        ],
      ),
    );
  }
}
