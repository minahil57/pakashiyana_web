import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:global_expert/core/config/supabase.dart';
import 'package:global_expert/export.dart';
import 'package:global_expert/services/get_properties_services.dart';


class ShopController extends GetxController {
  final AddPropertyController addPropertyController = Get.find();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  PropertyUploadService propertyUploadService = PropertyUploadService();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController propertyTitleController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController areaSizeController = TextEditingController();
  TextEditingController areaUnitController = TextEditingController();
  TextEditingController bedroomsController = TextEditingController();
  TextEditingController bathroomsController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController floors = TextEditingController();
  TextEditingController monthlyRentController = TextEditingController();

  String _propertyType = '';
  String get propertyType => _propertyType;

  set setPropertyType(String type) {
    _propertyType = type;
    update();
  }

  List<String> titles = [
    'House',
    'Villa',
    'Banglow',
    'Farmhouse',
    'Haveli',
  ];

  String _title = '';
  String get title => _title;

  set setTitle(String type) {
    _title = type;
    update();
  }

  void selectPropertyType(String type) {
    setPropertyType = type;
  }

  String _state = '';
  String get state => _state;

  set setState(String type) {
    _state = type;
    update();
  }

  String _areaUnit = '';
  String get areaUnit => _areaUnit;

  set setAreaUnit(String type) {
    _areaUnit = type;
    update();
  }

  String _city = '';
  String get city => _city;

  set setCity(String type) {
    _city = type;
    update();
  }

  String _builtInYear = '';

  String get builtInYear => _builtInYear;

  set setBuiltInYear(String type) {
    _builtInYear = type;
    update();
  }

  String _propertyFor = 'Rent';
  String get propertyFor => _propertyFor;
  set setProperty(String tab) {
    _propertyFor = tab;
    update();
  }

  void setPropertyFor(String type) {
    setProperty = type;
  }

  String _leaseAgreement = '';
  String get leaseAgreement => _leaseAgreement;
  set setLeaseAgreement(String type) {
    _leaseAgreement = type;
    update();
  }

  String _furnished = '';
  String get furnished => _furnished;
  set setFurnished(String type) {
    _furnished = type;
    update();
  }

  void selectFurnished(String type) {
    setFurnished = type;
  }

  String _constructionState = '';

  String get constructionState => _constructionState;

  set setConstructionState(String type) {
    _constructionState = type;
    update();
  }

  void selectConstructionState(String type) {
    setConstructionState = type;
  }

  List<String> shopAmenities = [
    'Separate Electricity',
    'Water',
  ];

  List<String> selectedAmenities = [];
  void postShop() {
    if (formKey.currentState!.validate()) {
      if (city == '' ||
          state == '' ||
          addPropertyController.images.isEmpty ||
          selectedAmenities.isEmpty ||
          builtInYear == '') {
        Snackbars.error('Please Enter Complete Details');
      } else {
        addProperty();
      }
    }
  }

  Future<void> addProperty() async {
    EasyLoading.show();
    final response = await propertyUploadService.uploadPropertyWithImages(
        property: PropertyModel(
            amenities: selectedAmenities,
            areaSize: int.parse(areaSizeController.text.trim()),
            areaUnit: 'Sqft',
            category: addPropertyController.selectedCategory,
            description: descriptionController.text,
            isApproved: false,
            propertyStatus: furnished,
            isBlacklisted: false,
            isPromoted: false,
            createdAt: DateTime.now(),
            location: addressController.text,
            phoneNo: phoneNumberController.text,
            price: int.parse(monthlyRentController.text.trim()),
            propertyFor: propertyFor,
            propertyId: '',
            propertyImages: [],
            propertyTitle: propertyTitleController.text,
            propertyType: propertyType,
            titleImage: '',
            uid: supabase.auth.currentUser!.id,
            builtIn: builtInYear.isEmpty ? null : int.parse(builtInYear),
            userViews: [],
            state: state,
            city: city),
        titleImageFile: addPropertyController.images.first,
        propertyImageFiles: addPropertyController.images);
    EasyLoading.dismiss();
    if (response == true) {
      EasyLoading.dismiss();
      Snackbars.success('Property added successfully');
      Get.offNamed(Routes.dashboard);
    } else {
      EasyLoading.dismiss();
      Snackbars.error('Something went wrong');
    }
    EasyLoading.dismiss();
  }

  Future<void> selectYear(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          child: SizedBox(
            height: 300, // Adjust height as needed
            child: Theme(
              data: Theme.of(context).copyWith(
                dialogBackgroundColor:
                    Colors.white, // Background color of the dialog
                colorScheme: const ColorScheme.light(
                  primary: kcPrimaryColor, // Highlighted year color
                  onPrimary: kcWhitecolor, // Text color on highlighted year
                  surface: kcLightGrey, // Picker surface background
                ),
              ),
              child: YearPicker(
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
                selectedDate: DateTime.now(),
                onChanged: (value) {
                  Get.back();
                  setBuiltInYear = value.year.toString();
                  log(builtInYear);
                },
              ),
            ),
          ),
        );
      },
    );
  }
  @override
  void onInit() {
    super.onInit();
    if (addPropertyController.propertyModel != null) {
      selectedAmenities = addPropertyController.propertyModel!.amenities;
      setPropertyType = addPropertyController.propertyModel!.propertyType;
      setPropertyFor(addPropertyController.propertyModel!.propertyFor!);
      setFurnished = addPropertyController.propertyModel!.propertyStatus!;
      setState = addPropertyController.propertyModel!.state;
      setCity = addPropertyController.propertyModel!.city;
      setBuiltInYear = addPropertyController.propertyModel!.builtIn.toString();
      setCity = addPropertyController.propertyModel!.city;
      setState = addPropertyController.propertyModel!.state;
      // floorController.text =
      //     addPropertyController.propertyModel!.floor.toString();
      bedroomsController.text =
          addPropertyController.propertyModel!.bedrooms.toString();
      areaSizeController.text =
          addPropertyController.propertyModel!.areaSize.toString();
      monthlyRentController.text =
          addPropertyController.propertyModel!.price.toString();
      // titleController.text = addPropertyController.propertyModel!.propertyTitle;
      descriptionController.text =
          addPropertyController.propertyModel!.description;
      addressController.text = addPropertyController.propertyModel!.location;
      phoneNumberController.text = addPropertyController.propertyModel!.phoneNo;
    }
  }
}
