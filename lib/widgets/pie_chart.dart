import 'package:fl_chart/fl_chart.dart';
import 'package:global_expert/export.dart';

class CustomPieChart extends StatelessWidget {
  const CustomPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sectionsSpace: 2,
        centerSpaceRadius: 40,
        sections: [
          PieChartSectionData(
            color: kcPrimaryColor,
            value: 35,
            title: '35%',
            radius: 60,
            titleStyle: const TextStyle(
              color: Colors.white, 
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          PieChartSectionData(
            color: const Color(0xFF3949AB),
            value: 30,
            title: '30%',
            radius: 60,
            titleStyle: const TextStyle(
              color: Colors.white, 
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          PieChartSectionData(
            color: const Color(0xFF5E35B1),
            value: 35,
            title: '35%',
            radius: 60,
            titleStyle: const TextStyle(
              color: Colors.white, 
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}