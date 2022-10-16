import 'package:demo/view/pages/screens/cart.dart';
import 'package:demo/view/pages/screens/grocery.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../view/pages/screens/favorite.dart';

class DashboardController extends GetxController {
  var index = 0.obs;
  List<IconData> bIcons = const [
    Icons.store_mall_directory_outlined,
    Icons.notifications,
    Icons.favorite_outline,
    Icons.account_balance_wallet_outlined,
  ];
  List<String> title = [
    'Grocery',
    'News',
    'Favorite',
    'Cart',
  ];
  List<Widget> screens = [Grocery(), Grocery(), Favorite(), Cart()];
}
