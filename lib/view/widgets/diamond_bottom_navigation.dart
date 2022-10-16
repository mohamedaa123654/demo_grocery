import 'package:demo/controller/cart_controller.dart';
import 'package:demo/core/utils/color_manager.dart';
import 'package:demo/core/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DiamondBottomNavigation extends StatelessWidget {
  final List<IconData> itemIcons;
  final List<String> title;
  final IconData centerIcon;
  final int selectedIndex;
  final Function(int) onItemPressed;
  final double? height;
  final Color selectedColor;
  final Color selectedLightColor;
  final Color unselectedColor;
  const DiamondBottomNavigation({
    Key? key,
    required this.title,
    required this.itemIcons,
    required this.centerIcon,
    required this.selectedIndex,
    required this.onItemPressed,
    this.height,
    this.selectedColor = ColorManager.primary,
    this.unselectedColor = const Color(0xffB5C8E7),
    this.selectedLightColor = ColorManager.primary,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    final height = this.height ?? SizeConfig.h * 0.076;

    return SizedBox(
      height: height + SizeConfig.h * (0.025),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height,
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeConfig.w * (0.1)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              splashColor: selectedColor.withOpacity(0.5),
                              onTap: () {
                                onItemPressed(0);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      itemIcons[0],
                                      color: selectedIndex == 0
                                          ? selectedColor
                                          : unselectedColor,
                                    ),
                                  ),
                                  Text(
                                    title[0],
                                    style: TextStyle(
                                        color: selectedIndex == 0
                                            ? selectedColor
                                            : unselectedColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              splashColor: selectedColor.withOpacity(0.5),
                              onTap: () {
                                onItemPressed(1);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      itemIcons[1],
                                      color: selectedIndex == 1
                                          ? selectedColor
                                          : unselectedColor,
                                    ),
                                  ),
                                  Text(
                                    title[1],
                                    style: TextStyle(
                                        color: selectedIndex == 1
                                            ? selectedColor
                                            : unselectedColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              splashColor: selectedColor.withOpacity(0.5),
                              onTap: () {
                                onItemPressed(2);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      itemIcons[2],
                                      color: selectedIndex == 2
                                          ? selectedColor
                                          : unselectedColor,
                                    ),
                                  ),
                                  Text(
                                    title[2],
                                    style: TextStyle(
                                        color: selectedIndex == 2
                                            ? selectedColor
                                            : unselectedColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Material(
                            color: Colors.transparent,
                            child: InkWell(
                              customBorder: const CircleBorder(),
                              splashColor: selectedColor.withOpacity(0.5),
                              onTap: () {
                                onItemPressed(3);
                              },
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Icon(
                                      itemIcons[3],
                                      color: selectedIndex == 3
                                          ? selectedColor
                                          : unselectedColor,
                                    ),
                                  ),
                                  Text(
                                    title[3],
                                    style: TextStyle(
                                        color: selectedIndex == 3
                                            ? selectedColor
                                            : unselectedColor),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                    color: ColorManager.primary, shape: BoxShape.circle),
                child: GetX<CartController>(
                    init: CartController(),
                    builder: (value) {
                      return Center(
                        child: Text(
                          '\$ ${value.totalPriceForAllProducts} ',
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: ColorManager.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      );
                    }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
