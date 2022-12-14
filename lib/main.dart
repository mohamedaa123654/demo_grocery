
import 'package:demo/core/routes/app_pages.dart';
import 'package:demo/core/routes/app_routes.dart';
import 'package:demo/view/pages/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
       initialRoute: AppRoutes.LAYOUT,
      getPages: AppPages.list,
    );
  }
}
