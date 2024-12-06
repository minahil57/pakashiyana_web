import 'package:global_expert/module/add_property/main/add_property_controller.dart';

import '../../../../export.dart';

class CategorySelector extends GetView<AddPropertyController> {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddPropertyController());
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: kcLightGrey,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetBuilder<AddPropertyController>(
            init: AddPropertyController(),
            builder: (controller) {
              return Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                runSpacing: 10,
                children: [
                  ...controller.categories.map(
                    (e) {
                      final bool isSelected =
                          controller.selectedCategory == e.name;
                      return GestureDetector(
                        onTap: () {
                          controller.setSelectedCategory = e.name;
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30),
                          decoration: BoxDecoration(
                            color: isSelected ? kcSecondaryColor : kcWhitecolor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            e.name,
                            style: getRegularStyle(
                              fontSize: 12,
                              color: isSelected ? kcWhitecolor : kcBlackColor,
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
