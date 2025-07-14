part of '../index.dart';

class DashboardMetrics extends StatelessWidget {
  const DashboardMetrics({super.key});

  List<StatData> get _statsData => StatDataList.statData();

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 1.4,
      ),
      delegate: SliverChildBuilderDelegate(
        (context, index) => MetricItem(stat: _statsData[index]),
        childCount: _statsData.length,
      ),
    );
  }
}
