import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:global_expert/export.dart';

class PakAshiyana extends StatelessWidget {
  const PakAshiyana({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'PakAshiyana',
      debugShowCheckedModeBanner: false,
      theme: theme,
      locale: const Locale('en_US'),
      fallbackLocale: const Locale('en_US'),
      translations: CustomTranslations(),
      defaultTransition: Transition.cupertino,
      builder: EasyLoading.init(),
      initialRoute: AppRouter.initialRoute,
      getPages: AppRouter.pages(),
    );
  }
}
