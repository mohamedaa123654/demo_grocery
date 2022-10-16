import 'package:get/get.dart';
import '../../controller/favorits_controoler.dart';


class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FavoritController>(() => FavoritController());
  }
}