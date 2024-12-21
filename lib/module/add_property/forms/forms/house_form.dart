import 'dart:developer';

import 'package:csc_picker/csc_picker.dart';
import 'package:global_expert/export.dart';
import 'package:global_expert/widgets/amenities_dropdown.dart';
import 'package:global_expert/widgets/app_dropdown.dart';
import 'package:global_expert/widgets/custom_textfield.dart';
import 'package:global_expert/widgets/tab_selector.dart';
import 'package:global_expert/widgets/text_with_asteric.dart';


class HouseForm extends StatelessWidget {
  const HouseForm({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HouseController());
    return GetBuilder<HouseController>(builder: (controller) {
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
                  Visibility(
                    visible: controller.propertyFor == 'Sell',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AstericText(label: 'Corner/Non Corner'),
                        verticalSpace(5),
                        TabSelector(
                            firstTabText: 'Corner',
                            secondTabText: 'Non Corner',
                            selectedTab: controller.propertyType,
                            onTabSelected: (propertyType) {
                              controller.selectPropertyType(propertyType);
                            }),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: controller.propertyFor == 'Rent',
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const AstericText(label: 'Commercial/Residential'),
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
                        const AstericText(label: 'Furnished/Unfurnished'),
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
                      const AstericText(label: 'Lease Agreement/Govt Only'),
                      verticalSpace(5),
                      TabSelector(
                          firstTabText: 'Cash',
                          secondTabText: 'Govt Only',
                          selectedTab: controller.leaseAgreement,
                          onTabSelected: (propertyType) {
                            controller.setLeaseAgreement = propertyType;
                          }),
                    ],
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
                currentCity: controller.city,
                currentState: controller.state,
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
              GetBuilder<HouseController>(
                  id: 'amenities',
                  builder: (controller) {
                    return AmenityDropdownButton(
                      items: controller.homeAmenities,
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
                    label: 'Bedrooms',
                  ),
                  verticalSpace(5),
                  AppTextField(
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please enter number of bedrooms';
                      }
                      return null;
                    },
                    labelText: 'Bedrooms',
                    controller: controller.bedroomsController,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
              verticalSpace(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AstericText(
                    label: 'Floors',
                  ),
                  verticalSpace(5),
                  AppTextField(
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please enter number of Floors';
                      }
                      return null;
                    },
                    labelText: 'Floors',
                    controller: controller.floors,
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
              verticalSpace(10),
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
                        TabSelector(
                            firstTabText: 'Marla',
                            secondTabText: 'Kanal',
                            selectedTab: controller.areaUnit,
                            onTabSelected: (value) {
                              controller.setAreaUnit = value;
                            })
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
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return 'Please enter area size';
                            }
                            return null;
                          },
                          labelText: 'Area Size',
                          controller: controller.areaSizeController,
                          keyboardType: TextInputType.number,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              verticalSpace(10),
              const AstericText(
                label: 'Title',
              ),
              verticalSpace(5),
              CustomDropdown(
                items: controller.titles,
                labelText: 'Title',
                selectedItem: controller.title == '' ? null : controller.title,
                onChanged: (p0) {
                  controller.setTitle = p0 ?? '';
                },
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
              const AstericText(
                label: 'Price',
              ),
              verticalSpace(5),
              AppTextField(
                validator: (p0) {
                  if (p0!.isEmpty) {
                    return 'Please enter price';
                  }
                  return null;
                },
                labelText: 'Price',
                controller: controller.priceController,
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
                    controller.postHome();
                  }),
            ]),
      );
    });
  }
}
