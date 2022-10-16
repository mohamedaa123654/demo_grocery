import 'package:demo/controller/grocery_controller.dart';
import 'package:demo/core/utils/size_config.dart';
import 'package:demo/models/favorite_model.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'color_manager.dart';
import 'package:flutter/material.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key, required this.title, required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: SizeConfig.w * 0.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorManager.border, width: 2),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 50,
              width: 50,
              // padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: ColorManager.grey,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: ColorManager.text),
                ),
                SizedBox(
                  width: 110,
                  child: Text(
                    subTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: ColorManager.text,
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SearchTextField extends StatelessWidget {
  // TextEditingController controller;
  TextInputType type;
  ValueChanged<String>? onChange;
  VoidCallback? onTap;
  String? label;
  String? hintText;
  IconData prefix;
  IconData? suffix;
  VoidCallback? suffixPressed;
  bool isClickable;

  SearchTextField({
    Key? key,
    // required this.controller,
    required this.type,
    this.hintText,
    this.onChange,
    this.onTap,
    this.label,
    required this.prefix,
    this.suffix,
    this.suffixPressed,
    this.isClickable = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: SizedBox(
        height: 50,
        child: TextField(
          cursorColor: ColorManager.text,
          style: const TextStyle(color: ColorManager.text),
          keyboardType: type,
          enabled: isClickable,
          onChanged: onChange,
          onTap: onTap,
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.fromLTRB(12, 30, 12, 5),
              labelText: label,
              hintText: hintText,
              hintStyle: const TextStyle(
                color: ColorManager.text,
              ),
              fillColor: ColorManager.primary,
              focusColor: ColorManager.primary,
              labelStyle: const TextStyle(color: ColorManager.text),
              prefixIcon: Icon(
                prefix,
                color: ColorManager.text,
              ),
              suffixIcon: suffix != null
                  ? IconButton(
                      onPressed: suffixPressed,
                      icon: Icon(
                        suffix,
                        color: ColorManager.text,
                      ),
                    )
                  : null,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: const BorderSide(
                  color: ColorManager.text,
                ),
              ),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: ColorManager.text,
                    width: 5.0,
                  ),
                  borderRadius: BorderRadius.circular(10))),
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.title, required this.color});
  final String title;
  final String color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: hexToColor(color),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              title,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: ColorManager.text),
            ),
          ),
        ],
      ),
    );
  }
}

class DealsCard extends GetView<GroceryController> {
  final controller = Get.put(GroceryController());
  DealsCard(
      {super.key,
      required this.name,
      required this.noPieces,
      required this.time,
      required this.oldPrice,
      this.onPressed,
      required this.newPrice});
  final String name;
  final int noPieces;
  final int time;
  final int oldPrice;
  final int newPrice;
  bool? isFavorite ;
  Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Stack(
                children: [
                  Container(
                    height: 108,
                    width: 108,
                    decoration: BoxDecoration(
                      color: ColorManager.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  Positioned(
                      top: -12,
                      left: -12,
                      child: Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: ColorManager.white,
                        ),
                        child: Container(
                          padding: const EdgeInsets.only(top: 8, left: 4),
                          child: IconButton(
                              onPressed: () {
                                isFavorite = !(isFavorite??false);
                                 controller.update();
                              },
                              icon: isFavorite??false
                                  ? const Icon(
                                      Icons.favorite,
                                      color: ColorManager.primary,
                                      size: 18,
                                    )
                                  : const Icon(
                                      Icons.favorite_outline,
                                      color: ColorManager.text,
                                      size: 18,
                                    )),
                        ),
                      ))
                ],
              ),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: ColorManager.text),
                    ),
                    Text(
                      'Pieces $noPieces',
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: ColorManager.text,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.location_on_outlined,
                            size: 16, color: ColorManager.text),
                        Text(
                          ' $time Minutes Away',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: ColorManager.text,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '\$ $newPrice  ',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: ColorManager.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$ $oldPrice',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: ColorManager.grey,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Poster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        height: 132,
        width: SizeConfig.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: ColorManager.poster,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 124,
                width: 124,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              SizedBox(
                height: 124,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Mega',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              color: ColorManager.primary),
                        ),
                        Stack(
                          children: const [
                            Text(
                              'WHOPP    ',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Color(0xff21114B),
                                  fontSize: 31,
                                  fontWeight: FontWeight.bold),
                            ),
                            Positioned(
                              right: 21,
                              child: Text(
                                'E',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: ColorManager.primary,
                                    fontSize: 31,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              child: Text(
                                'R',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Color(0xff21114B),
                                    fontSize: 31,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: const [
                        Text(
                          '\$ 15  ',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: ColorManager.primary,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$ 20',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: ColorManager.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                    const Text(
                      '* Available until 24 December 2022',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: ColorManager.white,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

