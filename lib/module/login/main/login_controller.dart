import 'dart:developer';

import 'package:global_expert/core/config/supabase.dart';
import 'package:global_expert/export.dart';
import 'package:global_expert/services/authentication_services.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _showOTPSide = false;
  bool get showOTPSide => _showOTPSide;
  TextEditingController get emailController => _emailController;
  AuthServices authServices = AuthServices();
  TextEditingController otpController = TextEditingController();

  set showOTPSide(value) {
    _showOTPSide = value;
    update(['login']);
  }

  set emailController(value) {
    _emailController.value = value;
    update();
  }

  validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter an email';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  void doLogin() {
    if (loginFormKey.currentState!.validate()) {
      login();
    }
  }

  Future<void> login() async {
    bool success = await authServices.login(emailController.text);
    log(success.toString());
    if (success) {
      showOTPSide = true;
    }
  }

  Future<void> verifyOTP(String otp) async {
    bool success = await authServices.verifyOTP(emailController.text, otp);
    log(success.toString());
    if (success) {
      log(supabase.auth.currentUser!.id.toString());
      Get.toNamed(Routes.dashboard);
    }
  }

  // Future<void> login() async {
  //   Get.toNamed(Routes.dashboard);
  // }

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: getMediumStyle(),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  void onBackPress() {}
}
