

import 'package:global_expert/export.dart';

class CategorySelector extends GetView<AddPropertyController> {
  const CategorySelector({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddPropertyController());
    return Container(
      width: MediaQuery.of(context).size.width,
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
                alignment: WrapAlignment.start,
                spacing: 12,
                runSpacing: 10,
                children: [
                  ...controller.categories.map(
                    (e) {
                      final bool isSelected =
                          controller.selectedCategory == e.name;
                      return GestureDetector(
                        onTap: () {
                          controller.selectedCategory = e.name!;
                        },
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.sizeOf(context).width * 0.26,
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 5),
                          decoration: BoxDecoration(
                            color: isSelected ? kcSecondaryColor : kcWhitecolor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             Icon(e.icon,
                                  size: 20,
                                 
                                  color:
                                      isSelected ? kcWhitecolor : kcBlackColor),
                              horizontalSpace(2),
                              Text(
                                e.name!,
                                style: getRegularStyle(
                                  fontSize: 12,
                                  color:
                                      isSelected ? kcWhitecolor : kcBlackColor,
                                ),
                              ),
                            ],
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
