import 'package:global_expert/export.dart';
import 'package:global_expert/core/layout/left_layout.dart';
import 'package:global_expert/module/properties/widget/adproperty.dart';
import 'package:global_expert/module/properties/widget/property_list.dart';

class PropertyManagementScreen extends StatelessWidget {
  const PropertyManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PropertiesController());
    return MyLayout(
      child: Material(
        color: const Color(0xFFF8F9FD),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GetBuilder<PropertiesController>(builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderView(),
                verticalSpaceMedium,
                controller.addPropertyTrue
                    ? const Expanded(child: AddProperty())
                    : const Expanded(
                        child: PropertyListView(),
                      ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

// import 'package:global_expert/export.dart';
// import 'package:global_expert/core/layout/left_layout.dart';
// import 'package:global_expert/module/properties/widget/adproperty.dart';

// class PropertyManagementScreen extends StatelessWidget {
//   const PropertyManagementScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Get.put(PropertiesController());
//     return MyLayout(
//       child: Material(
//         color: const Color(0xFFF8F9FD),
//         child: Padding(
//           padding: const EdgeInsets.all(32),
//           child: GetBuilder<PropertiesController>(builder: (controller) {
//             return Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const HeaderView(),
//                 verticalSpaceLarge,
//                 controller.addPropertyTrue
//                     ? const Expanded(child: AddProperty())
//                     : const Expanded(
//                         child: TableWidget(),
//                       ),
//               ],
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
