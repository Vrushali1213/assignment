import 'package:get/get.dart';
import 'package:jobportal/dashboard/dashboard_binding.dart';
import 'package:jobportal/dashboard/dashboard_page.dart';
import 'package:jobportal/signin/firstpage.dart';
import 'package:jobportal/signin/signin_home.dart';

import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.SIGNIN,
      page: () => SignInHomePage(),
    ),

    GetPage(
      name: AppRoutes.DASHBOARD,
      page: () => DashboardPage(),
      binding: DashboardBinding(),
    ),

    GetPage(
      name: AppRoutes.FIRSTPAGE,
      page: () => FirstPage(),
    ),

  ];
}