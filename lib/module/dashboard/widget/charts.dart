import 'package:fl_chart/fl_chart.dart';
import 'package:global_expert/export.dart';
import 'package:global_expert/widgets/chart_card.dart';

class ChartsSection extends StatelessWidget {
  const ChartsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: ChartCard(
            title: 'User Growth Trend',
            chart: SizedBox(
              height: 300,
              child: LineChart(
                _buildLineChartData(controller.userGrowthData),
              ),
            ),
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: ChartCard(
            title: 'Property Distribution',
            chart: SizedBox(
              height: 300,
              child: PieChart(
                PieChartData(
                  sections: [
                    PieChartSectionData(
                      color: kcPrimaryColor,
                      value: 35,
                      title: '35%',
                      radius: 60,
                      titleStyle:
                          const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    PieChartSectionData(
                      color: const Color(0xFF3949AB),
                      value: 30,
                      title: '30%',
                      radius: 60,
                      titleStyle:
                          const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    PieChartSectionData(
                      color: const Color(0xFF5E35B1),
                      value: 35,
                      title: '35%',
                      radius: 60,
                      titleStyle:
                          const TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  LineChartData _buildLineChartData(List<FlSpot> userGrowthData) {
    return LineChartData(
      gridData: const FlGridData(show: false),
      titlesData: const FlTitlesData(show: false),
      borderData: FlBorderData(show: false),
      lineBarsData: [
        LineChartBarData(
          spots: userGrowthData,
          isCurved: true,
          color: kcPrimaryColor,
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
          belowBarData: BarAreaData(
            show: true,
            color: kcPrimaryColor.withOpacity(0.1),
          ),
        ),
      ],
    );
  }
}
