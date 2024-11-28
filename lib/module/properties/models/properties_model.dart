class PropertyModel {
  List<String> amenities;
  int areaSize;
  int areaUnit;
  int bathrooms;
  int bedrooms;
  String titleImage;
  String category;
  String description;
  bool isApproved;
  bool isBlacklisted;
  String propertState;
  String propertyStatus;
  bool isPromoted;
  String location;
  String phoneNo;
  int price;
  String propertyFor;
  String propertyId;
  List<String> propertyImages;
  String propertyTitle;
  String propertyType;
  int builtIn;
  String uid;
  DateTime createdAt;

  PropertyModel({
    required this.amenities,
    required this.areaSize,
    required this.areaUnit,
    required this.bathrooms,
    required this.bedrooms,
    required this.category,
    required this.description,
    required this.isApproved,
    required this.propertState,
    required this.propertyStatus,
    required this.isBlacklisted,
    required this.isPromoted,
    required this.location,
    required this.phoneNo,
    required this.price,
    required this.propertyFor,
    required this.propertyId,
    required this.propertyImages,
    required this.propertyTitle,
    required this.propertyType,
    required this.titleImage,
    required this.uid,
    required this.builtIn,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      'amenities': amenities,
      'area_size': areaSize,
      'area_unit': areaUnit,
      'bathrooms': bathrooms,
      'bedrooms': bedrooms,
      'property_category': category,
      'propert_state': propertState,
      'property_status': propertyStatus,
      'property_description': description,
      'is_active': isApproved,
      'is_blacklisted': isBlacklisted,
      'is_promoted': isPromoted,
      'created_at': createdAt.toIso8601String(),
      'propery_location': location,
      'phone_number': phoneNo,
      'property_price': price,
      'property_for': propertyFor,
      'property_images': propertyImages,
      'property_title': propertyTitle,
      'property_type': propertyType,
      'title_image': titleImage,
      'uid': uid,
      'built_in': builtIn,
      'id': propertyId
    };
  }

  // Create a PropertyModel instance from a Map
  factory PropertyModel.fromMap(Map<String, dynamic> map) {
    return PropertyModel(
        amenities: List<String>.from(map['amenities']),
        areaSize: map['area_size'] ?? 0,
        areaUnit: map['area_unit'] ?? 0,
        bathrooms: map['bathrooms'] ?? 0,
        propertState: map['propert_state'] ?? '',
        propertyStatus: map['property_status'] ?? '',
        titleImage: map['title_image'] ?? '',
        bedrooms: map['bedrooms'] ?? 0,
        category: map['property_category'] ?? '',
        description: map['property_description'] ?? '',
        isApproved: map['is_active'] ?? false,
        isBlacklisted: map['is_blacklisted'] ?? false,
        isPromoted: map['is_promoted'] ?? false,
        createdAt: map['created_at'] != null
            ? DateTime.parse(map['created_at'])
            : DateTime.now(),
        location: map['propery_location'] ?? '',
        phoneNo: map['phone_number'] ?? '',
        price: map['property_price'] ?? 0,
        propertyFor: map['property_for'] ?? '',
        propertyId: map['id'] ?? '',
        propertyImages: List<String>.from(map['property_images'] ?? []),
        propertyTitle: map['property_title'] ?? '',
        propertyType: map['property_type'] ?? '',
        uid: map['uid'] ?? '',
        builtIn: map['built_in'] ?? 0);
  }
}
