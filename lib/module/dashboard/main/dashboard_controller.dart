import 'package:fl_chart/fl_chart.dart';
import 'package:global_expert/export.dart';

class DashboardController extends GetxController{
 final Map<String, dynamic> metrics = {
    'totalUsers': 1250,
    'activeUsers': 890,
    'totalAds': 3200,
    'promotedAds': 450,
    'pendingAds': 120,
    'blacklistedAds': 25,
  };
   // Sample chart data
  final List<FlSpot> userGrowthData = [
    const FlSpot(0, 1000),
    const FlSpot(1, 1120),
    const FlSpot(2, 1190),
    const FlSpot(3, 1250),
  ];
}