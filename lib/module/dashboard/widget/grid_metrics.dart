import 'package:global_expert/core/config/supabase.dart';
import 'package:global_expert/export.dart';
import 'package:global_expert/widgets/metric_card.dart';

class GridMetrics extends StatelessWidget {
  const GridMetrics({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(DashboardController());
    return GetBuilder<DashboardController>(
      builder: (controller) => LayoutBuilder(
        builder: (context, constraints) {
          // Determine number of columns based on screen width
          int crossAxisCount = constraints.maxWidth > 600 ? 2 : 1;
          
          return GridView.count(
            crossAxisCount: crossAxisCount,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: constraints.maxWidth > 600 ? 2 : 1.5,
            children: [
              BuildEnhancedMetricCard(
                title: 'Total Users',
                value: controller.users.length.toString(),
                icon: Icons.people_outline,
                color: kcPrimaryColor,
              ),
              BuildEnhancedMetricCard(
                title: 'No of Cities',
                value: cities.length.toString(),
                icon: Icons.person_outline,
                color: const Color(0xFF00897B),
              ),
              BuildEnhancedMetricCard(
                title: 'Total Properties',
                value: properties.length.toString(),
                icon: Icons.apartment_outlined,
                color: const Color(0xFF3949AB),
              ),
              BuildEnhancedMetricCard(
                title: 'Promoted Ads',
                value: properties.where((p) => p.isPromoted).length.toString(),
                icon: Icons.trending_up_outlined,
                color: const Color(0xFF5E35B1),
              ),
              BuildEnhancedMetricCard(
                title: 'BlackListed Properties',
                value: properties.where((p) => p.isBlacklisted).length.toString(),
                icon: Icons.block_outlined,
                color: const Color(0xFFD32F2F),
              ),
            ],
          );
        },
      ),
    );
  }
}
// import 'package:global_expert/core/config/supabase.dart';
// import 'package:global_expert/export.dart';
// import 'package:global_expert/widgets/metric_card.dart';

// class GridMetrics extends StatelessWidget {
//   const GridMetrics({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(DashboardController());
//     return GetBuilder<DashboardController>(
//       builder: (controller) => GridView.count(
//         crossAxisCount: 4,
//         shrinkWrap: true,
//         crossAxisSpacing: 24,
//         mainAxisSpacing: 24,
//         childAspectRatio: 2,
//         children: [
//           BuildEnhancedMetricCard(
//             title: 'Total Users',
//             value: controller.users.length.toString(),
//             icon: Icons.people_outline,
//             color: kcPrimaryColor,
//           ),
//           BuildEnhancedMetricCard(
//             title: 'No of Cities',
//             value: cities.length.toString(),
//             icon: Icons.person_outline,
//             color: const Color(0xFF00897B),
//           ),
//           BuildEnhancedMetricCard(
//             title: 'Total Properties',
//             value: properties.length.toString(),
//             icon: Icons.apartment_outlined,
//             color: const Color(0xFF3949AB),
//           ),
//           BuildEnhancedMetricCard(
//             title: 'Promoted Ads',
//             value: properties.where((p) => p.isPromoted).length.toString(),
//             icon: Icons.trending_up_outlined,
//             color: const Color(0xFF5E35B1),
//           ),
//           BuildEnhancedMetricCard(
//             title: 'BlackListed Properties',
//             value: properties.where((p) => p.isBlacklisted).length.toString(),
//             icon: Icons.trending_up_outlined,
//             color: const Color(0xFF5E35B1),
//           ),
//         ],
//       ),
//     );
//   }
// }
