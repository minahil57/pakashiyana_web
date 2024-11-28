import 'package:global_expert/export.dart';

class LoginController extends GetxController {
  final loginFormKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _showOTPSide = false;
  bool get showOTPSide => _showOTPSide;
  TextEditingController get emailController => _emailController;

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

  Future onContinuePressed() async {
    if (loginFormKey.currentState!.validate()) {
      showOTPSide = true;
      update(['login']);
    }
  }

  Future<void> login() async {
    Get.toNamed(Routes.dashboard);
  }


  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: getMediumStyle(),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  void onBackPress() {
  }
}
