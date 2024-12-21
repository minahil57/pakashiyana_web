import 'dart:developer';

import 'package:csc_picker/csc_picker.dart';
import 'package:global_expert/export.dart';
import 'package:global_expert/widgets/amenities_dropdown.dart';
import 'package:global_expert/widgets/custom_textfield.dart';
import 'package:global_expert/widgets/tab_selector.dart';
import 'package:global_expert/widgets/text_with_asteric.dart';

class ShopForm extends StatelessWidget {
  const ShopForm({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ShopController());
    return GetBuilder<ShopController>(builder: (controller) {
      return Form(
        key: controller.formKey,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
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
                      const AstericText(label: 'Road/In Building'),
                      verticalSpace(5),
                      TabSelector(
                          firstTabText: 'Road',
                          secondTabText: 'In Building',
                          selectedTab: controller.propertyType,
                          onTabSelected: (propertyType) {
                            controller.selectPropertyType(propertyType);
                          }),
                    ],
                  ),
                ],
              ),
              verticalSpace(10),
              Row(
                mainAxisAlignment: controller.propertyFor == 'Rent'
                    ? MainAxisAlignment.spaceBetween
                    : MainAxisAlignment.start,
                children: [
                  Visibility(
                    visible: controller.propertyFor == 'Rent',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AstericText(label: 'Inventory/ No Inventory'),
                        verticalSpace(5),
                        TabSelector(
                            firstTabText: 'Inventory',
                            secondTabText: 'No Inventory',
                            selectedTab: controller.furnished,
                            onTabSelected: (furnished) {
                              controller.selectFurnished(furnished);
                            })
                      ],
                    ),
                  ),
                ],
              ),
              verticalSpace(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AstericText(label: 'Build In Year'),
                  verticalSpace(5),
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
                          style:
                              getRegularStyle(color: kcTextGrey, fontSize: 12)),
                    ),
                  ),
                ],
              ),
              verticalSpace(10),
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
              verticalSpace(10),
              const AstericText(
                label: 'Location',
              ),
              verticalSpace(5),
              AppTextField(
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'Please enter location';
                  }
                  return null;
                },
                labelText: 'Location',
                controller: controller.addressController,
              ),
              verticalSpace(10),
              const AstericText(
                label: 'Amenities',
              ),
              verticalSpace(5),
              GetBuilder<ShopController>(
                  id: 'amenities',
                  builder: (controller) {
                    return AmenityDropdownButton(
                      items: controller.shopAmenities,
                      selectedItems: controller.selectedAmenities,
                      onSelectionChanged: (selectedAmenities) {
                        controller.selectedAmenities = selectedAmenities;
                      },
                    );
                  }),
              verticalSpace(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AstericText(
                    label: 'Area Square Feet',
                  ),
                  verticalSpace(5),
                  AppTextField(
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please enter area square feet';
                      }
                      return null;
                    },
                    labelText: 'Area Square Feet',
                    controller: controller.areaSizeController,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
              verticalSpace(10),
              const AstericText(
                label: 'Building Name OR Market Name',
              ),
              verticalSpace(5),
              AppTextField(
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'Please enter Building Name';
                  }
                  return null;
                },
                labelText: 'Building Name OR Market Name',
                controller: controller.propertyTitleController,
                keyboardType: TextInputType.text,
              ),
              verticalSpace(10),
              const AstericText(
                label: 'Description',
              ),
              verticalSpace(5),
              AppTextField(
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
                labelText: 'Description',
                controller: controller.descriptionController,
                maxLines: 10,
              ),
              verticalSpace(10),
              AstericText(
                label:
                    controller.propertyFor == 'Rent' ? 'Monthly Rent' : 'Price',
              ),
              verticalSpace(5),
              AppTextField(
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return controller.propertyFor == 'Rent'
                        ? 'Please enter monthly rent'
                        : 'Please enter price';
                  }
                  return null;
                },
                labelText:
                    controller.propertyFor == 'Rent' ? 'Monthly Rent' : 'Price',
                controller: controller.monthlyRentController,
                keyboardType: TextInputType.number,
              ),
              verticalSpace(10),
              const AstericText(
                label: 'Phone Number',
              ),
              verticalSpace(5),
              AppTextField(
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
                labelText: 'Phone Number',
                controller: controller.phoneNumberController,
                keyboardType: TextInputType.number,
              ),
              verticalSpace(20),
              PrimaryButton(
                  text: 'Publish',
                  onPressed: () {
                    controller.postShop();
                  }),
            ]),
      );
    });
  }
}
