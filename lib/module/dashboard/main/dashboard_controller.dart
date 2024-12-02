import 'package:fl_chart/fl_chart.dart';
import 'package:global_expert/core/config/supabase.dart';
import 'package:global_expert/export.dart';
import 'package:global_expert/services/get_properties_services.dart';
import 'package:global_expert/services/get_users.dart';

class DashboardController extends GetxController {
  PropertyUploadService propertyService = PropertyUploadService();
  GetUsers getUsers = GetUsers();
  List<UserData> users = [];
  @override
  void onInit() async {
    await propertyService
        .getProperties()
        .then((value) => properties.value = value);
    propertyService.getCities();
    users = await getUsers.fetchUsers();
    update();
    super.onInit();
  }

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
