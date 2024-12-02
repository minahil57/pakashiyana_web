import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:global_expert/export.dart';

class GetUsers {
  final supabase = Supabase.instance.client;
  Future<List<UserData>> fetchUsers() async {
    EasyLoading.show();
    try {
      final response = await supabase.from('user').select(
          'user_name, user_email, user_mobile, created_at ,is_active,id');
      EasyLoading.dismiss();
      log(response.toString());
      return (response as List).map((user) => UserData.fromMap(user)).toList();
    } catch (e) {
      EasyLoading.dismiss();
      log('Error fetching users: $e');
      throw Exception('Failed to fetch users');
    }
  }

  Future<bool> activeUser(String id, bool status) async {
    try {
      await supabase.from('user').update({
        'is_active': status,
      }).eq('id', id);
      return true;
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
