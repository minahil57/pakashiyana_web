import 'package:global_expert/export.dart';
import 'package:global_expert/core/layout/left_layout.dart';
import 'package:global_expert/module/properties/widget/adproperty.dart';

class PropertyManagementScreen extends StatelessWidget {
  const PropertyManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PropertiesController());
    return MyLayout(
      child: Material(
        color: const Color(0xFFF8F9FD),
        child: Padding(
          padding: EdgeInsets.all(32),
          child: GetBuilder<PropertiesController>(builder: (controller) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderView(),
                verticalSpaceLarge,
                controller.addPropertyTrue
                    ? Expanded(child: AddProperty())
                    : Expanded(
                        child: TableWidget(),
                      ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
