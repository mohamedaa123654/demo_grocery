import 'package:demo/controller/dashboard_controller.dart';
import 'package:demo/view/widgets/diamond_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/custom_address.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<DashboardController>(
        init: DashboardController(),
        builder: (controller) {
          return Scaffold(
              bottomNavigationBar: customBottomNavigationBar(),
              body: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 60, right: 12, left: 12, bottom: 12),
                    child: CustomAddress(text: 'Oxford Street'),
                  ),
                  controller.screens[controller.index.value],
                ],
              ));
        });
  }

  GetX<DashboardController> customBottomNavigationBar() {
    return GetX<DashboardController>(
        init: DashboardController(),
        builder: (value) {
          return DiamondBottomNavigation(
            title: value.title,
            itemIcons: value.bIcons,
            centerIcon: Icons.place,
            selectedIndex: value.index.value,
            onItemPressed: (x) {
              value.index.value = x;
            },
          );
        });
  }
}
