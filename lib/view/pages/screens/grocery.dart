import 'package:demo/controller/grocery_controller.dart';
import 'package:demo/core/utils/color_manager.dart';
import 'package:demo/core/utils/componant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Grocery extends GetView<GroceryController> {

  var searchController = TextEditingController();
  final controller = Get.put(GroceryController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.only(top: 20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SearchTextField(
            type: TextInputType.text,
            prefix: Icons.search,
            hintText: 'Search in thousands of products',
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(height: 70, child: Addresses()),
          const SizedBox(
            height: 20,
          ),
          const CategoryTitle(),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 100,
            child: Categories(),
          ),
          const DealsOfTheDayTitle(),
          const SizedBox(
            height: 10,
          ),
          Deals(controller: controller),
          const SizedBox(
            height: 20,
          ),
          Poster(),
        ]),
      ),
    );
  }
}
// Display Deals ListView
class Deals extends StatelessWidget {
  const Deals({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final GroceryController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Obx(() {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.dealItems.length,
            itemBuilder: (context, index) {
              return DealsCard(
                name: controller.dealItems[index].name,
                noPieces: controller.dealItems[index].noPieces,
                time: controller.dealItems[index].time,
                newPrice: controller.dealItems[index].newPrice,
                oldPrice: controller.dealItems[index].oldPrice,
              );
            });
      }),
    );
  }
}
// Display Categories ListView
class Categories extends GetView<GroceryController> {
  final controller = Get.put(GroceryController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categoryItems.length,
          itemBuilder: ((context, index) {
            return CategoryItem(
              title: controller.categoryItems[index].title,
              color: controller.categoryItems[index].color,
            );
          }));
    });
  }
}
// Display Category Title
class CategoryTitle extends StatelessWidget {
  const CategoryTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Explore by Category",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
            ),
          ),
          InkWell(
            onTap: () {
              // navigateTo(context, const PopularMovies());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    'See More',
                    style: TextStyle(fontSize: 13, color: ColorManager.grey),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Display Deals Of The Day Title
class DealsOfTheDayTitle extends StatelessWidget {
  const DealsOfTheDayTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Deals of the day",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.15,
            ),
          ),
          InkWell(
            onTap: () {
              // navigateTo(context, const PopularMovies());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    'See More',
                    style: TextStyle(fontSize: 13, color: ColorManager.grey),
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16.0,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
// Display Addresses ListView
class Addresses extends GetView<GroceryController> {
  final controller = Get.put(GroceryController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.addressItems.length,
            itemBuilder: ((context, index) {
              return AddressCard(
                title: controller.addressItems[index].title,
                subTitle: controller.addressItems[index].subTitle,
              );
            })),
      );
    });
  }
}
