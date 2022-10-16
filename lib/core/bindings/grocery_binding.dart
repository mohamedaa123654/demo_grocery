import 'package:demo/controller/grocery_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GroceryController>(() => GroceryController());
  }
}
