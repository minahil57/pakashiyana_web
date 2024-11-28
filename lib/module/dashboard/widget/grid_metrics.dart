
import 'package:global_expert/export.dart';
import 'package:global_expert/widgets/metric_card.dart';

class GridMetrics extends StatelessWidget {
  const GridMetrics({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DashboardController());
    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      crossAxisSpacing: 24,
      mainAxisSpacing: 24,
      childAspectRatio: 1.5,
      children: [
        BuildEnhancedMetricCard(
          title :'Total Users',
         value: controller.metrics['totalUsers'].toString(),
         icon: Icons.people_outline,
         color: kcPrimaryColor,
         subtitle:  '+12.5% from last month',
        ),
        BuildEnhancedMetricCard(
          title:'Active Users',
          value:controller.metrics['activeUsers'].toString(),
          icon:Icons.person_outline,
         color: const Color(0xFF00897B),
         subtitle: '89% of total users',
        ),
        BuildEnhancedMetricCard(
         title:  'Total Properties',
         value: controller.metrics['totalAds'].toString(),
         icon: Icons.apartment_outlined,
         color: const Color(0xFF3949AB),
         subtitle: '+24 new listings',
        ),
        BuildEnhancedMetricCard(
         title:  'Promoted Ads',
         value:  controller.metrics['promotedAds'].toString(),
         icon: Icons.trending_up_outlined,
         color:  const Color(0xFF5E35B1),
         subtitle:  'Revenue: \$15,240',
        ),
      ],
    );
  }
}
