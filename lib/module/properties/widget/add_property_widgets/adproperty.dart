import 'dart:developer';
import 'dart:typed_data';

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:global_expert/module/add_property/main/add_property_controller.dart';
import 'package:global_expert/module/properties/widget/add_property_widgets/category_selector.dart';
import 'package:global_expert/module/properties/widget/selector_tabs.dart';
import 'package:global_expert/widgets/amenities_dropdown.dart';
import 'package:global_expert/widgets/custom_textfield.dart';
import 'package:global_expert/widgets/text_with_asteric.dart';

import '../../../../export.dart';

class AddProperty extends StatelessWidget {
  const AddProperty({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddPropertyController());
    return Padding(
      padding: const EdgeInsets.all(10),
      child: GetBuilder<AddPropertyController>(builder: (controller) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: 300,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: kcLightGrey),
                    borderRadius: BorderRadius.circular(8),
                    color: kcLightGrey,
                  ),
                  child: Column(
                    children: [
                      Row(children: [
                        ...controller.images.map((e) {
                          return Container(
                            height: 100,
                            width: 100,
                            margin: const EdgeInsets.all(8),
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(color: kcLightGrey),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Stack(
                              children: [
                                Image.network(
                                  e.path,
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: GestureDetector(
                                    onTap: () {
                                      controller.images.removeAt(
                                          controller.images.indexOf(e));
                                      controller.update();
                                    },
                                    child: const Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        })
                      ]),
                      Expanded(child: Container()),
                      PrimaryButton(
                          text: 'Upload Images',
                          onPressed: () {
                            controller.getImages();
                          })
                    ],
                  )),
//               SizedBox(
//   height: 300,
//   child: Container(
//     padding: const EdgeInsets.all(8),
//     decoration: BoxDecoration(
//       border: Border.all(color: kcLightGrey),
//       borderRadius: BorderRadius.circular(8),
//       color: kcLightGrey,
//     ),
//     child: Stack(
//       children: [
//         Align(
//           alignment: Alignment.center,
//           child: Text(
//             'Drop your images here',
//             style: getRegularStyle(
//               fontSize: 12,
//               color: kcTextGrey,
//             ),
//           ),
//         ),
//         Row(
//           children: [
//             ...controller.images.map((e) {
//               // Ensure that e contains the image data in the correct format (Uint8List)
//               final imageData = e.getNative(); // Adjust this to the correct property name for image data in your DropzoneFileInterface
//               return Container(
//                 margin: const EdgeInsets.all(8),
//                 padding: const EdgeInsets.all(8),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Image.memory(
//                   imageData, // Use the Uint8List here
//                   fit: BoxFit.cover,
//                 ),
//               );
//             })
//           ],
//         ),
//         DropzoneView(
//           operation: DragOperation.copy,
//           cursor: CursorType.grab,
//           onCreated: (DropzoneViewController ctrl) => controller.controller1 = ctrl,
//           onLoaded: () => print('Zone loaded'),
//           onError: (String? ev) => print('Error: $ev'),
//           onHover: () => print('Zone hovered'),
//           onDropFile: (DropzoneFileInterface file) {
//             // Use file.getData() or equivalent method to get the image data
//             controller.addImages(file);
//             log(controller.images.length.toString());
//           },
//           onDropString: (String s) => print('Drop: $s'),
//           onLeave: () => print('Zone left'),
//         ),
//       ],
//     ),
//   ),
// ),

              verticalSpaceMedium,
              const CategorySelector(),
              verticalSpaceMedium,
              const SelectorTabs(),
              verticalSpaceMedium,
              GestureDetector(
                onTap: () {
                  controller.selectYear(context);
                },
                child: Container(
                  width: Get.width,
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 13,
                    bottom: 13,
                  ),
                  decoration: BoxDecoration(
                    color: kcLightGrey,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: kcBorderColor),
                  ),
                  child: Text(
                      controller.builtInYear == ''
                          ? 'Build In Year'
                          : controller.builtInYear,
                      style: getRegularStyle(color: kcTextGrey, fontSize: 12)),
                ),
              ),
              verticalSpace(20),
              const AstericText(
                label: 'State & City',
              ),
              verticalSpace(5),
              CSCPicker(
                showStates: true,
                showCities: true,
                flagState: CountryFlag.DISABLE,
                dropdownDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: kcLightGrey,
                    border: Border.all(color: kcBorderColor, width: 1)),
                disabledDropdownDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: kcLightGrey,
                    border: Border.all(color: kcBorderColor, width: 1)),
                countrySearchPlaceholder: "Country",
                stateSearchPlaceholder: "State",
                citySearchPlaceholder: "City",
                countryDropdownLabel: "Country",
                stateDropdownLabel: "State",
                cityDropdownLabel: "City",
                defaultCountry: CscCountry.Pakistan,
                currentCountry: 'Pakistan',
                countryFilter: const [
                  CscCountry.Pakistan,
                ],
                disableCountry: true,
                selectedItemStyle:
                    getRegularStyle(color: kcTextGrey, fontSize: 12),
                dropdownHeadingStyle:
                    getMediumStyle(color: kcBlackColor, fontSize: 20),
                dropdownItemStyle: getRegularStyle(
                  color: kcBlackColor,
                  fontSize: 12,
                ),
                dropdownDialogRadius: 8.0,
                searchBarRadius: 8.0,
                onStateChanged: (String? value) {
                  controller.setState = value ?? '';
                  log(controller.state);
                },
                onCityChanged: (value) {
                  controller.setCity = value ?? '';
                  log(controller.city);
                },
              ),
              verticalSpace(20),
              const AstericText(
                label: 'Amenities',
              ),
              verticalSpace(5),
              GetBuilder<AddPropertyController>(
                  id: 'amenities',
                  builder: (controller) {
                    return AmenityDropdownButton(
                      items: controller.selectedCategory == 'House'
                          ? controller.homeAmenities
                          : controller.selectedCategory == 'Land'
                              ? controller.landAmenities
                              : controller.selectedCategory == 'Shops'
                                  ? controller.shopAmenities
                                  : controller.selectedCategory == 'Plaza'
                                      ? controller.plazaAmenities
                                      : controller.selectedCategory ==
                                              'Appartment'
                                          ? controller.apartmentAmenities
                                          : controller.plotAmenities,
                      selectedItems: controller.selectedAmenities,
                      onSelectionChanged: (selectedAmenities) {
                        controller.selectedAmenities = selectedAmenities;
                      },
                    );
                  }),
              verticalSpace(20),
              Visibility(
                visible: controller.selectedCategory == 'House' ||
                    controller.selectedCategory == 'Appartment',
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AstericText(
                            label: 'Bathrooms',
                          ),
                          verticalSpace(5),
                          AppTextField(
                            labelText: 'Bathrooms',
                            controller: controller.bathroomsController,
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                    horizontalSpace(10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AstericText(
                            label: 'Bedrooms',
                          ),
                          verticalSpace(5),
                          AppTextField(
                            labelText: 'Bedrooms',
                            controller: controller.bedroomsController,
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpace(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AstericText(
                          label: 'Area Units',
                        ),
                        verticalSpace(5),
                        AppTextField(
                          labelText: 'Area Units',
                          controller: controller.areaUnitController,
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                  horizontalSpace(10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AstericText(
                          label: 'Area Size',
                        ),
                        verticalSpace(5),
                        AppTextField(
                          labelText: 'Area Size',
                          controller: controller.areaSizeController,
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              verticalSpace(20),
              const AstericText(
                label: 'Property Title',
              ),
              verticalSpace(5),
              AppTextField(
                labelText: 'Property Title',
                controller: controller.propertyTitleController,
              ),
              verticalSpace(20),
              const AstericText(
                label: 'Description',
              ),
              verticalSpace(5),
              AppTextField(
                maxLines: 3,
                labelText: 'Description',
                controller: controller.descriptionController,
              ),
              verticalSpace(20),
              const AstericText(
                label: 'Price',
              ),
              verticalSpace(5),
              AppTextField(
                labelText: 'Price',
                controller: controller.priceController,
                keyboardType: TextInputType.number,
              ),
              verticalSpace(20),
              const AstericText(
                label: 'Location',
              ),
              verticalSpace(5),
              AppTextField(
                labelText: 'Location',
                controller: controller.addressController,
              ),
              verticalSpace(20),
              const AstericText(
                label: 'Phone Number',
              ),
              verticalSpace(5),
              AppTextField(
                labelText: 'Phone Number',
                controller: controller.phoneNumberController,
                keyboardType: TextInputType.number,
              ),
              verticalSpace(20),
              PrimaryButton(
                text: 'Publish',
                onPressed: () => controller.addProperty(),
              ),
            ],
          ),
        );
      }),
    );
  }
}
