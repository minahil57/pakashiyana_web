import 'dart:developer';
import 'dart:io';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:global_expert/core/config/supabase.dart';
import 'package:global_expert/module/properties/models/properties_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as path;

class PropertyUploadService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<bool> uploadPropertyWithImages({
    required PropertyModel property,
    required File titleImageFile,
    required List<File> propertyImageFiles,
  }) async {
    try {
      // Generate unique folder name for this property
      final String folderName = const Uuid().v4();

      // Upload title image
      final String titleImagePath = await _uploadImage(
        imageFile: titleImageFile,
        folderName: folderName,
        isTitle: true,
      );

      // Upload property images
      List<String> propertyImageUrls = [];
      for (File imageFile in propertyImageFiles) {
        final String imageUrl = await _uploadImage(
          imageFile: imageFile,
          folderName: folderName,
          isTitle: false,
        );
        propertyImageUrls.add(imageUrl);
      }

      // Update the property model with image URLs
      final propertyMap = property.toMap();
      propertyMap['title_image'] = titleImagePath;
      propertyMap['property_images'] = propertyImageUrls;
      propertyMap['id'] = const Uuid().v4();

      // Insert into the property table
      await supabase.from('property').insert(propertyMap);

      return true;
    } catch (e) {
      log('Error uploading property: $e');
      // Handle any cleanup if needed
      return false;
    }
  }

  Future<String> _uploadImage({
    required File imageFile,
    required String folderName,
    required bool isTitle,
  }) async {
    try {
      final String fileName = path.basename(imageFile.path);
      final String fileExtension = path.extension(fileName);
      final String uniqueFileName = '${const Uuid().v4()}$fileExtension';

      final String storagePath = isTitle
          ? 'property_images/$folderName/title_$uniqueFileName'
          : 'property_images/$folderName/$uniqueFileName';

      await supabase.storage
          .from('property_images')
          .upload(storagePath, imageFile);

      return supabase.storage.from('property_images').getPublicUrl(storagePath);
    } catch (e) {
      log('Error uploading image: $e');
      rethrow;
    }
  }

  Future<List<PropertyModel>> getProperties() async {
    EasyLoading.show();
    final response = await supabase
        .from('property')
        .select('*')
        .order('created_at', ascending: true);

    log(response.toString());
    List<PropertyModel> properties =
        response.map((property) => PropertyModel.fromMap(property)).toList();
    EasyLoading.dismiss();
    return properties;
  }

  Future<List<PropertyModel>> getBlackListedProperties() async {
    EasyLoading.show();
    final response =
        await supabase.from('property').select('*').eq('is_blacklisted', true);
    log(response.toString());
    List<PropertyModel> properties =
        response.map((property) => PropertyModel.fromMap(property)).toList();

    EasyLoading.dismiss();

    return properties;
  }

  Future<List<Map<String, dynamic>>> getCities() async {
    try {
      // Perform the query
      final response = await supabase
          .from('property')
          .select('city') // This condition excludes rows where 'city' is null
          .order('city', ascending: true);
      cities = List<String>.from(response.map((city) => city['city']));
      return List<Map<String, dynamic>>.from(response);
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  Future<void> makePropertyBlackListed(
      String propertyId, bool isBlacklisted) async {
    try {
      EasyLoading.show();
      await supabase
          .from('property')
          .update({'is_blacklisted': !isBlacklisted}).eq('id', propertyId);
      EasyLoading.dismiss();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> makePropertyPromoted(String propertyId, bool isPromoted) async {
    try {
      EasyLoading.show();
      await supabase
          .from('property')
          .update({'is_promoted': !isPromoted}).eq('id', propertyId);
      EasyLoading.dismiss();
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> makePropertyACtive(String propertyId, bool isActive) async {
    try {
      EasyLoading.show();
      await supabase
          .from('property')
          .update({'is_active': !isActive}).eq('id', propertyId);
      EasyLoading.dismiss();
    } catch (e) {
      log(e.toString());
    }
  }
}
