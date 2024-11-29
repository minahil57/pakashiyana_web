import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:global_expert/core/config/supabase.dart';
import 'package:global_expert/export.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await supabaseInit();

  EasyLoading.instance
    ..textStyle = getRegularStyle(fontSize: 12, color: Colors.white)
    ..loadingStyle = EasyLoadingStyle.custom
    ..backgroundColor = kcPrimaryColor
    ..radius = 12
    ..indicatorSize = 30
    ..textColor = Colors.white
    ..indicatorColor = Colors.white
    ..userInteractions = false
    ..displayDuration = const Duration(seconds: 1)
    ..dismissOnTap = false;
  runApp(const PakAshiyana());
}
