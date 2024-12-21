import 'dart:developer';

import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/services.dart';
import 'package:global_expert/export.dart';
import 'package:global_expert/widgets/amenities_dropdown.dart';
import 'package:global_expert/widgets/custom_textfield.dart';
import 'package:global_expert/widgets/tab_selector.dart';
import 'package:global_expert/widgets/text_with_asteric.dart';


class LandForm extends StatelessWidget {
  const LandForm({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LandController());
    return GetBuilder<LandController>(builder: (controller) {
      return Form(
          key: controller.formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              ],
            ),
            verticalSpace(10),
            const AstericText(label: 'Land front in feets '),
            verticalSpace(5),
            AppTextField(
              labelText: 'Land front in feets',
              controller: controller.landFront,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            verticalSpace(10),
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
            GetBuilder<LandController>(
                id: 'amenities',
                builder: (controller) {
                  return AmenityDropdownButton(
                    items: controller.landAmenities,
                    selectedItems: controller.selectedAmenities,
                    onSelectionChanged: (selectedAmenities) {
                      controller.selectedAmenities = selectedAmenities;
                    },
                  );
                }),
            verticalSpace(10),
            const AstericText(
              label: 'Area in Kanal ',
            ),
            verticalSpace(5),
            AppTextField(
              validator: (p0) {
                if (p0!.isEmpty) {
                  return 'Please enter area';
                }
                return null;
              },
              labelText: 'Area in Kanal',
              controller: controller.areaSizeController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            ),
            verticalSpace(10),
            verticalSpace(10),
            const AstericText(
              label: 'Title',
            ),
            verticalSpace(5),
            AppTextField(
              validator: (p0) {
                if (p0!.isEmpty) {
                  return 'Please enter title';
                }
                return null;
              },
              labelText: 'Title',
              controller: controller.propertyTitleController,
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
                  controller.postLand();
                }),
          ]));
    });
  }
}
