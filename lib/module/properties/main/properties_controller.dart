import 'dart:developer';

import 'package:global_expert/core/config/supabase.dart';
import 'package:global_expert/export.dart';
import 'package:global_expert/services/get_properties_services.dart';

class PropertiesController extends GetxController {
  final homeController = Get.put(DashboardController());

  PropertyUploadService propertyService = PropertyUploadService();

  bool _addPropertyTrue = false;

  bool get addPropertyTrue => _addPropertyTrue;

  set addProperty(bool value) {
    _addPropertyTrue = value;
    update();
  }

  void toggleAddProperty() {
    addProperty = !addPropertyTrue;

    log(addPropertyTrue.toString());
  }

  @override
  void onInit() async {
    await propertyService
        .getProperties()
        .then((value) => properties.value = value);
    update();
    super.onInit();
  }

  Future<void> refreshProperties() async {
    await propertyService
        .getProperties()
        .then((value) => properties.value = value);
    update();
  }
  //final List<PropertyModel> properties = [
  //   PropertyModel(
  //     propertyId: "P001",
  //     propertyTitle: "Luxury Waterfront Villa",
  //     category: "Residential",
  //     description:
  //         "Beautiful 4-bedroom villa with stunning ocean views and modern amenities",
  //     propertyType: "Villa",
  //     propertyFor: "Sale",
  //     location: "Palm Jumeirah, Dubai",
  //     price: 5500000,
  //     bedrooms: 4,
  //     bathrooms: 5,
  //     areaSize: 4500,
  //     areaUnit: 0, // sq ft
  //     isApproved: true,
  //     isPromoted: true,
  //     isBlacklisted: false,
  //     phoneNo: "+971 50 123 4567",
  //     propertState: "Ready",
  //     propertyStatus: "Available",
  //     amenities: [
  //       "Swimming Pool",
  //       "Garden",
  //       "Smart Home",
  //       "Private Beach",
  //       "Security"
  //     ],
  //     propertyImages: [
  //       "https://images.unsplash.com/photo-1613490493576-7fde63acd811?ixlib=rb-4.0.3",
  //       "https://images.unsplash.com/photo-1613490493576-7fde63acd811?ixlib=rb-4.0.3",
  //     ],
  //     titleImage:
  //         "https://images.unsplash.com/photo-1613490493576-7fde63acd811?ixlib=rb-4.0.3",
  //     uid: "user123",
  //     builtIn: 2020,
  //     createdAt: DateTime.now().subtract(const Duration(days: 5)),
  //   ),
  //   PropertyModel(
  //     propertyId: "P002",
  //     propertyTitle: "Modern City Apartment",
  //     category: "Residential",
  //     description: "Stylish 2-bedroom apartment in downtown with city views",
  //     propertyType: "Apartment",
  //     propertyFor: "Rent",
  //     location: "Downtown Dubai",
  //     price: 120000,
  //     bedrooms: 2,
  //     bathrooms: 2,
  //     areaSize: 1200,
  //     areaUnit: 0,
  //     isApproved: true,
  //     isPromoted: false,
  //     isBlacklisted: false,
  //     phoneNo: "+971 50 234 5678",
  //     propertState: "Ready",
  //     propertyStatus: "Available",
  //     amenities: ["Gym", "Parking", "24/7 Security", "Pool"],
  //     propertyImages: [
  //       "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixlib=rb-4.0.3",
  //       "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixlib=rb-4.0.3",
  //     ],
  //     titleImage:
  //         "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixlib=rb-4.0.3",
  //     uid: "user124",
  //     builtIn: 2019,
  //     createdAt: DateTime.now().subtract(const Duration(days: 10)),
  //   ),
  //   PropertyModel(
  //     propertyId: "P003",
  //     propertyTitle: "Commercial Office Space",
  //     category: "Commercial",
  //     description: "Prime office space in business district",
  //     propertyType: "Office",
  //     propertyFor: "Rent",
  //     location: "Business Bay, Dubai",
  //     price: 250000,
  //     bedrooms: 0,
  //     bathrooms: 2,
  //     areaSize: 2500,
  //     areaUnit: 0,
  //     isApproved: false,
  //     isPromoted: false,
  //     isBlacklisted: false,
  //     phoneNo: "+971 50 345 6789",
  //     propertState: "Ready",
  //     propertyStatus: "Pending",
  //     amenities: [
  //       "Meeting Rooms",
  //       "Reception",
  //       "Parking",
  //       "High-speed Internet"
  //     ],
  //     propertyImages: [
  //       "https://images.unsplash.com/photo-1497366216548-37526070297c?ixlib=rb-4.0.3",
  //       "https://images.unsplash.com/photo-1497366216548-37526070297c?ixlib=rb-4.0.3",
  //     ],
  //     titleImage:
  //         "https://images.unsplash.com/photo-1497366216548-37526070297c?ixlib=rb-4.0.3",
  //     uid: "user125",
  //     builtIn: 2018,
  //     createdAt: DateTime.now().subtract(const Duration(days: 2)),
  //   ),
  //   PropertyModel(
  //     propertyId: "P004",
  //     propertyTitle: "Family Townhouse",
  //     category: "Residential",
  //     description: "Spacious 3-bedroom townhouse with garden",
  //     propertyType: "Townhouse",
  //     propertyFor: "Sale",
  //     location: "Arabian Ranches, Dubai",
  //     price: 2800000,
  //     bedrooms: 3,
  //     bathrooms: 3,
  //     areaSize: 2800,
  //     areaUnit: 0,
  //     isApproved: true,
  //     isPromoted: true,
  //     isBlacklisted: false,
  //     phoneNo: "+971 50 456 7890",
  //     propertState: "Ready",
  //     propertyStatus: "Available",
  //     amenities: ["Private Garden", "Maid's Room", "Community Pool", "Park"],
  //     propertyImages: [
  //       "https://images.unsplash.com/photo-1602343168117-bb8ffe3e2e9f?ixlib=rb-4.0.3",
  //       "https://images.unsplash.com/photo-1602343168117-bb8ffe3e2e9f?ixlib=rb-4.0.3",
  //     ],
  //     titleImage:
  //         "https://images.unsplash.com/photo-1602343168117-bb8ffe3e2e9f?ixlib=rb-4.0.3",
  //     uid: "user126",
  //     builtIn: 2021,
  //     createdAt: DateTime.now().subtract(const Duration(days: 15)),
  //   ),
  //   PropertyModel(
  //     propertyId: "P005",
  //     propertyTitle: "Studio Apartment",
  //     category: "Residential",
  //     description: "Cozy studio apartment, perfect for singles",
  //     propertyType: "Studio",
  //     propertyFor: "Rent",
  //     location: "JLT, Dubai",
  //     price: 45000,
  //     bedrooms: 0,
  //     bathrooms: 1,
  //     areaSize: 450,
  //     areaUnit: 0,
  //     isApproved: true,
  //     isPromoted: false,
  //     isBlacklisted: true, // Blacklisted property
  //     phoneNo: "+971 50 567 8901",
  //     propertState: "Ready",
  //     propertyStatus: "Not Available",
  //     amenities: ["Furnished", "Balcony", "Gym Access", "Pool Access"],
  //     propertyImages: [
  //       "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixlib=rb-4.0.3",
  //       "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixlib=rb-4.0.3",
  //     ],
  //     titleImage:
  //         "https://images.unsplash.com/photo-1522708323590-d24dbb6b0267?ixlib=rb-4.0.3",
  //     uid: "user127",
  //     builtIn: 2017,
  //     createdAt: DateTime.now().subtract(const Duration(days: 20)),
  //   ),
  //   PropertyModel(
  //     propertyId: "P006",
  //     propertyTitle: "Retail Space",
  //     category: "Commercial",
  //     description: "Prime retail space in shopping district",
  //     propertyType: "Retail",
  //     propertyFor: "Rent",
  //     location: "Dubai Mall Area",
  //     price: 350000,
  //     bedrooms: 0,
  //     bathrooms: 1,
  //     areaSize: 1800,
  //     areaUnit: 0,
  //     isApproved: false,
  //     isPromoted: false,
  //     isBlacklisted: false,
  //     phoneNo: "+971 50 678 9012",
  //     propertState: "Under Construction",
  //     propertyStatus: "Pending",
  //     amenities: ["Storage Room", "Display Windows", "Loading Bay", "CCTV"],
  //     propertyImages: [
  //       "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-4.0.3",
  //       "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-4.0.3",
  //     ],
  //     titleImage:
  //         "https://images.unsplash.com/photo-1441986300917-64674bd600d8?ixlib=rb-4.0.3",
  //     uid: "user128",
  //     builtIn: 2022,
  //     createdAt: DateTime.now().subtract(const Duration(days: 1)),
  //   ),
  // ];
}
