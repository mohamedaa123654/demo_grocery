import 'dart:convert';

import 'package:demo/models/cart_model.dart';
import 'package:demo/models/favorite_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class FavoritController extends GetxController {
  RxList favoriteItems = [].obs;
  RxInt cartCounter = 0.obs;
  bool favorite = false;

  @override
  void onInit() {
    getFavoriteItems();
    super.onInit();
  }

  Future<void> getFavoriteItems() async {
    final String response = await rootBundle.loadString('assets/db.json');
    List data = json.decode(response)['favorits'];
    favoriteItems.addAll(data.map((e) => FavoritsModel.fromJson(e)).toList());
  }

  addItem() {
    cartCounter++;
  }

  removeItem() {
    cartCounter > 0 ? cartCounter-- : null;
  }

  insertFavorit(bool favorits) {
    favorits = favorite;
  }
}
