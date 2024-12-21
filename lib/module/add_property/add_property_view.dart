import 'package:global_expert/core/layout/left_layout.dart';
import 'package:global_expert/export.dart';
import 'package:global_expert/widgets/text_with_asteric.dart';

class AddPropertyView extends GetView<AddPropertyController> {
  const AddPropertyView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddPropertyController());
    return MyLayout(
      // appBar: const TopBackAppBar(label: 'Post Your Property'),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
          child: GetBuilder<AddPropertyController>(
            builder: (_) => Form(
              key: controller.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ImagesContainer(),
                  const Divider(
                    color: kcBorderColor,
                    indent: 20,
                    endIndent: 20,
                  ),
                  const AstericText(
                    label: 'Category',
                  ),
                  verticalSpace(5),
                  const CategorySelector(),
                  verticalSpace(20),
                  //const SelectorTabs(),
                  Builder(builder: (context) {
                    switch (controller.selectedCategory) {
                      case 'House':
                        return const HouseForm();
                      case 'Appartment':
                        return const AppartmentForm();
                      case 'Shops':
                        return const ShopForm();
                      case 'Plaza':
                        return const PlazaForm();
                      case 'Land':
                        return const LandForm();
                      case 'Plots':
                        return const PlotForm();
                      default:
                        return Container();
                    }
                  })

                  // Visibility(
                  //   visible: controller.selectedCategory == 'House' ||
                  //       controller.selectedCategory == 'Appartment' ||
                  //       controller.selectedCategory == 'Shops' ||
                  //       controller.selectedCategory == 'Plaza',
                  //   child:
                  // Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       verticalSpace(20),
                  //       const AstericText(label: 'Build In Year'),
                  //       verticalSpace(5),
                  //       GestureDetector(
                  //         onTap: () {
                  //           controller.selectYear(context);
                  //         },
                  //         child: Container(
                  //           width: Get.width,
                  //           padding: const EdgeInsets.only(
                  //             left: 15,
                  //             right: 15,
                  //             top: 13,
                  //             bottom: 13,
                  //           ),
                  //           decoration: BoxDecoration(
                  //             color: kcLightGrey,
                  //             borderRadius: BorderRadius.circular(8),
                  //             border: Border.all(color: kcBorderColor),
                  //           ),
                  //           child: Text(
                  //               controller.builtInYear == ''
                  //                   ? 'Build In Year'
                  //                   : controller.builtInYear,
                  //               style: getRegularStyle(
                  //                   color: kcTextGrey, fontSize: 12)),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // verticalSpace(20),
                  // const AstericText(
                  //   label: 'State & City',
                  // ),
                  // verticalSpace(5),
                  // CSCPicker(
                  //   showStates: true,
                  //   showCities: true,
                  //   flagState: CountryFlag.DISABLE,
                  //   dropdownDecoration: BoxDecoration(
                  //       borderRadius:
                  //           const BorderRadius.all(Radius.circular(8)),
                  //       color: kcLightGrey,
                  //       border: Border.all(color: kcBorderColor, width: 1)),
                  //   disabledDropdownDecoration: BoxDecoration(
                  //       borderRadius:
                  //           const BorderRadius.all(Radius.circular(8)),
                  //       color: kcLightGrey,
                  //       border: Border.all(color: kcBorderColor, width: 1)),
                  //   countrySearchPlaceholder: "Country",
                  //   stateSearchPlaceholder: "State",
                  //   citySearchPlaceholder: "City",
                  //   countryDropdownLabel: "Country",
                  //   stateDropdownLabel: "State",
                  //   cityDropdownLabel: "City",
                  //   defaultCountry: CscCountry.Pakistan,
                  //   currentCountry: 'Pakistan',
                  //   countryFilter: const [
                  //     CscCountry.Pakistan,
                  //   ],
                  //   disableCountry: true,
                  //   selectedItemStyle:
                  //       getRegularStyle(color: kcTextGrey, fontSize: 12),
                  //   dropdownHeadingStyle:
                  //       getMediumStyle(color: kcBlackColor, fontSize: 20),
                  //   dropdownItemStyle: getRegularStyle(
                  //     color: kcBlackColor,
                  //     fontSize: 12,
                  //   ),
                  //   dropdownDialogRadius: 8.0,
                  //   searchBarRadius: 8.0,
                  //   onStateChanged: (String? value) {
                  //     controller.setState = value ?? '';
                  //     log(controller.state);
                  //   },
                  //   onCityChanged: (value) {
                  //     controller.setCity = value ?? '';
                  //     log(controller.city);
                  //   },
                  // ),
                  // verticalSpace(20),
                  // const AstericText(
                  //   label: 'Amenities',
                  // ),
                  // verticalSpace(5),
                  // GetBuilder<AddPropertyController>(
                  //     id: 'amenities',
                  //     builder: (controller) {
                  //       return AmenityDropdownButton(
                  //         items: controller.selectedCategory == 'House'
                  //             ? controller.homeAmenities
                  //             : controller.selectedCategory == 'Land'
                  //                 ? controller.landAmenities
                  //                 : controller.selectedCategory == 'Shops'
                  //                     ? controller.shopAmenities
                  //                     : controller.selectedCategory == 'Plaza'
                  //                         ? controller.plazaAmenities
                  //                         : controller.selectedCategory ==
                  //                                 'Appartment'
                  //                             ? controller.apartmentAmenities
                  //                             : controller.plotAmenities,
                  //         selectedItems: controller.selectedAmenities,
                  //         onSelectionChanged: (selectedAmenities) {
                  //           controller.selectedAmenities = selectedAmenities;
                  //         },
                  //       );
                  //     }),
                  // verticalSpace(20),
                  // Visibility(
                  //   visible: controller.selectedCategory == 'House' ||
                  //       controller.selectedCategory == 'Appartment',
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Expanded(
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             const AstericText(
                  //               label: 'Bathrooms',
                  //             ),
                  //             verticalSpace(5),
                  //             AppTextField(
                  //               validator: (p0) {
                  //                 if (p0!.isEmpty) {
                  //                   return 'Please enter number of bathrooms';
                  //                 }
                  //                 return null;
                  //               },
                  //               labelText: 'Bathrooms',
                  //               controller: controller.bathroomsController,
                  //               keyboardType: TextInputType.number,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       horizontalSpace(10),
                  //       Expanded(
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             const AstericText(
                  //               label: 'Bedrooms',
                  //             ),
                  //             verticalSpace(5),
                  //             AppTextField(
                  //               validator: (p0) {
                  //                 if (p0!.isEmpty) {
                  //                   return 'Please enter number of bedrooms';
                  //                 }
                  //                 return null;
                  //               },
                  //               labelText: 'Bedrooms',
                  //               controller: controller.bedroomsController,
                  //               keyboardType: TextInputType.number,
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // verticalSpace(20),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           const AstericText(
                  //             label: 'Area Units',
                  //           ),
                  //           verticalSpace(5),
                  //           AppTextField(
                  //             validator: (p0) {
                  //               if (p0!.isEmpty) {
                  //                 return 'Please enter area units';
                  //               }
                  //               return null;
                  //             },
                  //             labelText: 'Area Units',
                  //             controller: controller.areaUnitController,
                  //             keyboardType: TextInputType.number,
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //     horizontalSpace(10),
                  //     Expanded(
                  //       child: Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           const AstericText(
                  //             label: 'Area Size',
                  //           ),
                  //           verticalSpace(5),
                  //           AppTextField(
                  //             validator: (p0) {
                  //               if (p0!.isEmpty) {
                  //                 return 'Please enter area size';
                  //               }
                  //               return null;
                  //             },
                  //             labelText: 'Area Size',
                  //             controller: controller.areaSizeController,
                  //             keyboardType: TextInputType.number,
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  // verticalSpace(20),
                  // const AstericText(
                  //   label: 'Property Title',
                  // ),
                  // verticalSpace(5),
                  // AppTextField(
                  //   validator: (p0) {
                  //     if (p0!.isEmpty) {
                  //       return 'Please enter property title';
                  //     }
                  //     return null;
                  //   },
                  //   labelText: 'Property Title',
                  //   controller: controller.propertyTitleController,
                  // ),
                  // verticalSpace(20),
                  // const AstericText(
                  //   label: 'Description',
                  // ),
                  // verticalSpace(5),
                  // AppTextField(
                  //   validator: (p0) {
                  //     if (p0!.isEmpty) {
                  //       return 'Please enter description';
                  //     }
                  //     return null;
                  //   },
                  //   maxLines: 3,
                  //   labelText: 'Description',
                  //   controller: controller.descriptionController,
                  // ),
                  // verticalSpace(20),
                  // const AstericText(
                  //   label: 'Price',
                  // ),
                  // verticalSpace(5),
                  // AppTextField(
                  //   validator: (p0) {
                  //     if (p0!.isEmpty) {
                  //       return 'Please enter price';
                  //     }
                  //     return null;
                  //   },
                  //   labelText: 'Price',
                  //   controller: controller.priceController,
                  //   keyboardType: TextInputType.number,
                  // ),
                  // verticalSpace(20),
                  // const AstericText(
                  //   label: 'Location',
                  // ),
                  // verticalSpace(5),
                  // AppTextField(
                  //   validator: (p0) {
                  //     if (p0!.isEmpty) {
                  //       return 'Please enter location';
                  //     }
                  //     return null;
                  //   },
                  //   labelText: 'Location',
                  //   controller: controller.addressController,
                  // ),
                  // verticalSpace(20),
                  // const AstericText(
                  //   label: 'Phone Number',
                  // ),
                  // verticalSpace(5),
                  // AppTextField(
                  //   validator: (p0) {
                  //     if (p0!.isEmpty) {
                  //       return 'Please enter phone number';
                  //     }
                  //     return null;
                  //   },
                  //   labelText: 'Phone Number',
                  //   controller: controller.phoneNumberController,
                  //   keyboardType: TextInputType.number,
                  // ),
                  // verticalSpace(20),
                  // PrimaryButton(
                  //     text: 'Publish', onPressed: () => controller.validate()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
