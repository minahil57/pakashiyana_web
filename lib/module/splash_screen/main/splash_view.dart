import 'package:global_expert/export.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
      body: Center(
        child: Image.asset(
          AssetPath.logo,
          width: 200,
        ),
      ),
    );
  }
}
