
import 'package:demo/controller/dashboard_controller.dart';
import 'package:demo/core/bindings/dashboard_binding.dart';
import 'package:demo/view/pages/dashboard.dart';
import 'package:get/get.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.LAYOUT,
      page: () => Dashboard(),
      binding: dashboardBinding(),
    ),
  ];
}
