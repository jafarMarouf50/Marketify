part of '../index.dart';

class MetricItem extends StatelessWidget {
  final StatData stat;

  const MetricItem({super.key, required this.stat});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColorsDark.secondary.withValues(alpha: .9),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: stat.color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(stat.icon, color: Colors.white, size: 20),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF10B981).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      stat.trend == 'up'
                            ? Icons.arrow_upward
                          : Icons.arrow_downward,
                      color: const Color(0xFF10B981),
                      size: 12,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      stat.change,
                      style: const TextStyle(
                        color: Color(0xFF10B981),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            stat.value,
            style: const TextStyle(
              // color: Color(0xFF111827),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            stat.title,
            style: const TextStyle(
              // color: Color(0xFF6B7280),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
    // return Container(
    //   padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
    //   decoration: BoxDecoration(
    //     color: AppColorsDark.container,
    //     borderRadius: BorderRadius.circular(12),
    //   ),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     mainAxisSize: MainAxisSize.min,
    //     children: [
    //       Row(
    //         children: [
    //           Container(
    //             width: 45,
    //             height: 45,
    //             decoration: BoxDecoration(
    //               color: color,
    //               borderRadius: BorderRadius.circular(12),
    //             ),
    //             child: Icon(icon),
    //           ),
    //
    //           Spacer(),
    //           Icon(Icons.trending_up, color: color, size: 14),
    //           const SizedBox(width: 4),
    //           Text(growth, style: TextStyle(color: color, fontSize: 12)),
    //         ],
    //       ),
    //       SizedBox(height: 16),
    //       Text(
    //         value,
    //         style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    //       ),
    //       SizedBox(height: 6),
    //       Text(label, style: const TextStyle(fontSize: 14, color: Colors.grey)),
    //     ],
    //   ),
    // );
  }
}
