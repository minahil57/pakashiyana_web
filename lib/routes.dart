import 'package:global_expert/export.dart';

class Routes {
  static const String login = '/auth/login';
  static const String dashboard = '/dashboard';

}

class AppRouter {
  static String initialRoute = Routes.dashboard;

  static List<GetPage> pages() {
    return [
      GetPage(name: Routes.login, page: () => const LoginView()),
    ];
  }
}

