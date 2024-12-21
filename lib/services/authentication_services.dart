import 'dart:developer';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:global_expert/core/config/supabase.dart';
import 'package:global_expert/export.dart';

class AuthServices {
  Future<bool> login(String email) async {
    EasyLoading.show();
    try {
      await supabase.auth.signInWithOtp(
        email: email,
      );
      log("OTP sent to email: $email");
      // final SharedPreferences prefs = await SharedPreferences.getInstance();
      // prefs.setBool('isLoggedIn', true);
      EasyLoading.dismiss();
      return true;
    } catch (e) {
      EasyLoading.dismiss();
      log("Error sending OTP to email: $e");
      return false;
    }
  }

  Future<bool> verifyOTP(String email, String otp) async {
    EasyLoading.show();
    try {
      await supabase.auth.verifyOTP(
        email: email,
        token: otp,
        type: OtpType.email,
      );

      log("OTP sent to email: $email");
      EasyLoading.dismiss();

      return true;
    } catch (e) {
      EasyLoading.dismiss();
      EasyLoading.showToast('Invalid OTP',
          toastPosition: EasyLoadingToastPosition.top);
      log("Error sending OTP to email: $e");
      return false;
    }
  }

  Future<bool> createUser(String email, String id) async {
    try {
      final existingUser =
          await supabase.from('user').select().eq('id', id).maybeSingle();

      if (existingUser != null) {
        return false;
      }
      final newUser = await supabase.from('user').insert({
        'id': id,
        'user_email': email,
        'created_at': DateTime.now().toIso8601String(),
      });
      if (newUser != null) {
        return true;
      } else {
        return false;
      }
    } catch (error) {
      log('Error: $error');
      return false;
    }
  }

  Future<void> logout() async {
    await supabase.auth.signOut();
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // prefs.setBool('isLoggedIn', false);
    Get.offAllNamed(Routes.login);
  }
}
