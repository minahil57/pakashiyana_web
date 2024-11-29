import 'package:global_expert/export.dart';
import 'package:global_expert/services/get_properties_services.dart';

class SplashController extends GetxController {
  PropertyUploadService propertyService = PropertyUploadService();
  @override
  void onInit() {
    super.onInit();

    Future.delayed(const Duration(seconds: 3), () {
      Get.offAllNamed(Routes.login);
    });
  }
}
