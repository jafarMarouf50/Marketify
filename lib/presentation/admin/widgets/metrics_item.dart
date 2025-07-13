part of '../index.dart';

class MetricItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String growth;
  final Color color;

  const MetricItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.growth,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: AppColorsDark.container,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon),
              ),

              Spacer(),
              Icon(Icons.trending_up, color: color, size: 14),
              const SizedBox(width: 4),
              Text(growth, style: TextStyle(color: color, fontSize: 12)),
            ],
          ),
          SizedBox(height: 16),
          Text(
            value,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 6),
          Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
        ],
      ),
    );
  }
}
