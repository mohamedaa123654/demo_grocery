import 'package:demo/controller/dashboard_controller.dart';
import 'package:demo/controller/grocery_controller.dart';
import 'package:get/get.dart';
import '../../controller/cart_controller.dart';
import '../../controller/favorits_controoler.dart';

class dashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
     Get.lazyPut<GroceryController>(() => GroceryController());
     Get.lazyPut<FavoritController>(() => FavoritController());
     Get.lazyPut<CartController>(() => CartController());
  }
}


