import 'dart:convert';
import 'package:demo/models/cart_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';



class CartController extends GetxController {
  RxList cartItems = [].obs;
  var totalPriceForAllProducts = 0.obs;
  late CartModel cartModel;

  @override
  void onInit() {
    getCartItems();
    super.onInit();
  }

  Future<void> getCartItems() async {
    final String response = await rootBundle.loadString('assets/db.json');
    List data = json.decode(response)['cart'];
    cartItems.addAll(data.map((e) => CartModel.fromJson(e)).toList());
  }

  totalPrice(int count,price) {

   return  count*price;
     
  }

 
}
