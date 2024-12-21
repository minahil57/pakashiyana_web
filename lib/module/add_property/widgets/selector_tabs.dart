

import 'package:global_expert/export.dart';
import 'package:global_expert/widgets/tab_selector.dart';
import 'package:global_expert/widgets/text_with_asteric.dart';

class SelectorTabs extends StatelessWidget {
  const SelectorTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddPropertyController>(
      builder: (controller) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AstericText(label: 'Rent/Sell'),
                  verticalSpace(5),
                  TabSelector(
                      firstTabText: 'Rent',
                      secondTabText: 'Sell',
                      selectedTab: controller.propertyFor,
                      onTabSelected: (propertyFor) {
                        controller.setPropertyFor(propertyFor);
                      })
                ],
              ),
              Visibility(
                visible: controller.selectedCategory == 'Shops',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AstericText(label: 'In plaza/In land'),
                    verticalSpace(5),
                    TabSelector(
                        firstTabText: 'In plaza',
                        secondTabText: 'In land',
                        selectedTab: controller.propertyType,
                        onTabSelected: (propertyType) {
                          controller.selectPropertyType(propertyType);
                        }),
                  ],
                ),
              ),
              Visibility(
                visible: controller.selectedCategory == 'Land' ||
                    controller.selectedCategory == 'Plots' ||
                    controller.selectedCategory == 'Plaza' ||
                    controller.selectedCategory == 'House' ||
                    controller.selectedCategory == 'Appartment',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AstericText(label: 'Commercial/Resdential'),
                    verticalSpace(5),
                    TabSelector(
                        firstTabText: 'Commercial',
                        secondTabText: 'Resdential',
                        selectedTab: controller.propertyType,
                        onTabSelected: (propertyType) {
                          controller.selectPropertyType(propertyType);
                        }),
                  ],
                ),
              ),
            ],
          ),
          verticalSpace(10),
          Visibility(
            visible: controller.selectedCategory == 'House' ||
                controller.selectedCategory == 'Appartment' ||
                controller.selectedCategory == 'Shops' ||
                controller.selectedCategory == 'Plaza',
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Visibility(
                    visible: controller.selectedCategory == 'Plaza',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AstericText(label: 'Parking Space'),
                        verticalSpace(5),
                        TabSelector(
                            firstTabText: '1',
                            secondTabText: '2',
                            selectedTab: controller.furnished,
                            onTabSelected: (furnished) {
                              controller.selectFurnished(furnished);
                            })
                      ],
                    )),
                Visibility(
                  visible: controller.selectedCategory == 'Shops' ||
                      controller.selectedCategory == 'House' ||
                      controller.selectedCategory == 'Appartment',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AstericText(label: 'Furnished'),
                      verticalSpace(5),
                      TabSelector(
                          firstTabText: 'Furnished',
                          secondTabText: 'Unfurnished',
                          selectedTab: controller.furnished,
                          onTabSelected: (furnished) {
                            controller.selectFurnished(furnished);
                          })
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AstericText(label: 'Construction state'),
                    verticalSpace(5),
                    TabSelector(
                      firstTabText: 'Grey Struct',
                      secondTabText: 'Finished',
                      selectedTab: controller.constructionState,
                      onTabSelected: (state) {
                        controller.selectConstructionState(state);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
