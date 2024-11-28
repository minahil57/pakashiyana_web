import 'package:global_expert/export.dart';

class SplashController extends GetxController{

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.login);
    });
  }

}