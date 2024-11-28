import 'package:global_expert/export.dart';

class Routes {
  static const String login = '/auth/login';
  static const String dashboard = '/dashboard';
  static const String splash = '/splash';
  static const String users = '/users';
  static const String properties = '/properties';
}

class AppRouter {
  static String initialRoute = Routes.splash;

  static List<GetPage> pages() {
    return [
      GetPage(name: Routes.login, page: () => const LoginView()),
      GetPage(name: Routes.dashboard, page: () => const AdminDashboard()),
      GetPage(name: Routes.splash, page: () => const SplashView()),
      GetPage(name: Routes.users, page: () => UserManagementScreen()),
      GetPage(name: Routes.properties, page: () => PropertyManagementScreen()),
    ];
  }
}
