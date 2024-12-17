import 'dart:developer';
import 'dart:io';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:global_expert/core/config/supabase.dart';
import 'package:global_expert/export.dart';
import 'package:global_expert/services/get_properties_services.dart';
import 'package:image_picker/image_picker.dart';

class AddPropertyController extends GetxController {
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

  int selectedImageIndex = 0;

  final picker = ImagePicker();
  List<File> _images = [];
  List<File> get images => _images;
  List<String> homeAmenities = [
    'Lift',
    'Net',
    'Window View',
    'Car Parking',
    'Gas',
    'Electricity (WAPDA)',
    'Water',
  ];
  List<String> apartmentAmenities = [
    'Lift',
    'Net',
    'Window View',
    'Car Parking',
    'Gas',
    'Electricity (WAPDA)',
    'Water',
  ];
  List<String> plotAmenities = [
    'Boundary Wall',
    'Water',
    'Road Access',
  ];
  List<String> shopAmenities = [
    'Separate Electricity',
    'Water',
  ];
  List<String> plazaAmenities = [
    'Car Parking',
    'Gas',
    'Electricity (WAPDA)',
    'Water',
    'Block Construction',
    'Brick Construction',
    'RCC Construction',
  ];
  List<String> landAmenities = [
    'Road Access',
    'Construction Included',
    'Agriculture',
    'Water',
  ];
  List<String> selectedAmenities = [];
  void addImages(File type) {
    _images.add(type);
    update();
  }

  void setImages(List<File> newImages) {
    _images = newImages;
    update();
  }

  List features = [];

  String _propertyType = '';
  String get propertyType => _propertyType;

  set setPropertyType(String type) {
    _propertyType = type;
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

  String _propertyFor = '';
  String get propertyFor => _propertyFor;
  set setProperty(String tab) {
    _propertyFor = tab;
    update();
  }

  void setPropertyFor(String type) {
    setProperty = type;
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

  Future getImages() async {
    final pickedFile = await picker.pickMultiImage(
        imageQuality: 100, maxHeight: 1000, maxWidth: 1000);
    List<XFile> xfilePick = pickedFile;

    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        addImages(File(xfilePick[i].path));
      }
    } else {
      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(const SnackBar(content: Text('Nothing is selected')));
    }
  }

  void updateSelectedImageIndex(int index) {
    selectedImageIndex = index;
    update();
  }

  void deleteImage(int index) {
    images.removeAt(index);
    if (selectedImageIndex >= images.length) {
      selectedImageIndex = images.length - 1;
    }
    if (selectedImageIndex < 0) {
      selectedImageIndex = 0;
    }
    update();
  }

  List<PropertFilter> categories = [
    PropertFilter('House', 'assets/images/house_icon.png'),
    PropertFilter('Appartment', 'assets/images/appartment_icon.png'),
    PropertFilter('Shops', 'assets/images/shop_icon.png'),
    PropertFilter('Plaza', 'assets/images/plaza_icon.png'),
    PropertFilter('Land', 'assets/images/land_icon.png'),
    PropertFilter('Plots', 'assets/images/plot_icon.png'),
  ];

  String _selectedCategory = 'House';

  String get selectedCategory => _selectedCategory;

  set setSelectedCategory(String type) {
    _selectedCategory = type;
    update();
  }

  Future<void> addProperty() async {
    EasyLoading.show();
    // if (formKey.currentState!.validate()) {
    final response = await propertyUploadService.uploadPropertyWithImages(
        property: PropertyModel(
            amenities: selectedAmenities,
            areaSize: int.parse(areaSizeController.text.trim()),
            areaUnit: areaUnitController.text.trim(),
           
            bedrooms: int.parse(bedroomsController.text.trim()),
            category: selectedCategory,
            description: descriptionController.text,
            isApproved: false,
            propertState: constructionState,
            propertyStatus: furnished,
            isBlacklisted: false,
            isPromoted: false,
            createdAt: DateTime.now(),
            location: addressController.text,
            phoneNo: phoneNumberController.text,
            price: int.parse(priceController.text.trim()),
            propertyFor: propertyFor,
            propertyId: '',
            propertyImages: [],
            propertyTitle: propertyTitleController.text,
            propertyType: propertyType,
            titleImage: '',
            uid: supabase.auth.currentUser!.id,
            builtIn: int.parse(builtInYear),
            userViews: [],
            state: state,
            city: city),
        titleImageFile: images.first,
        propertyImageFiles: images);
    EasyLoading.dismiss();
    if (response == true) {
      //Snackbars.success('Property added successfully');
      Get.back();
    } else {
      //Snackbars.error('Something went wrong');
    }
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
}

class PropertFilter {
  String name;
  String icon;
  PropertFilter(this.name, this.icon);
}
