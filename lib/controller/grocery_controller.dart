import 'dart:convert';
import 'dart:io';

import 'package:demo/models/address_model.dart';
import 'package:demo/models/category_model.dart';
import 'package:demo/models/deals_model.dart';
import 'package:demo/models/favorite_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class GroceryController extends GetxController {
  RxList categoryItems = [].obs;
  RxList dealItems = [].obs;
  RxList addressItems = [].obs;

  @override
  void onInit() {
    getCategoryItems();
    getDealItems();
    getAddressItems();
    super.onInit();
  }

  
  Future<void> getCategoryItems() async {
    final String response = await rootBundle.loadString('assets/db.json');
    List data = json.decode(response)['categories'];
    categoryItems.addAll(data.map((e) => CategoryModel.fromJson(e)).toList());
  }

  Future<void> getAddressItems() async {
    final String response = await rootBundle.loadString('assets/db.json');
    List data = json.decode(response)['addresses'];
    addressItems.addAll(data.map((e) => AddressesModel.fromJson(e)).toList());
  }

  Future<void> getDealItems() async {
    final String response = await rootBundle.loadString('assets/db.json');
    List data = json.decode(response)['deals'];
    dealItems.addAll(data.map((e) => DealsModel.fromJson(e)).toList());
  }

  
}
