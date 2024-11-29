import 'package:global_expert/module/add_property/main/add_property_controller.dart';
import 'package:global_expert/widgets/tab_selector.dart';
import 'package:global_expert/widgets/text_with_asteric.dart';

import '../../../export.dart';

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
              Column(
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
                      })
                ],
              ),
              Column(
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
          // verticalSpace(10),
          // Visibility(
          //   visible: controller.selectedCategory == 'House' ||
          //       controller.selectedCategory == 'Appartment' ||
          //       controller.selectedCategory == 'Shops' ||
          //       controller.selectedCategory == 'Plaza',
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           const AstericText(label: 'Furnished'),
          //           verticalSpace(5),
          //           TabSelector(
          //               firstTabText: 'Furnished',
          //               secondTabText: 'Unfurnished',
          //               selectedTab: controller.furnished,
          //               onTabSelected: (furnished) {
          //                 controller.selectFurnished(furnished);
          //               })
          //         ],
          //       ),
          //       Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         children: [
          //           const AstericText(label: 'Construction state'),
          //           verticalSpace(5),
          //           TabSelector(
          //             firstTabText: 'Grey Struct',
          //             secondTabText: 'Finished',
          //             selectedTab: controller.constructionState,
          //             onTabSelected: (state) {
          //               controller.selectConstructionState(state);
          //             },
          //           ),
          //         ],
          //       ),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
