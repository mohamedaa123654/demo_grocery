import 'package:demo/controller/cart_controller.dart';
import 'package:demo/core/utils/color_manager.dart';
import 'package:demo/core/utils/componant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends GetView<CartController> {
  final controller = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 20,
              left: 24,
              right: 24,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Cart',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: ColorManager.text),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              return ListView.builder(
                  itemCount: controller.cartItems.length,
                  itemBuilder: ((context, index) => Column(
                        children: [
                          CartCard(
                            color: controller.cartItems[index].color,
                            name: controller.cartItems[index].name,
                            weight: controller.cartItems[index].weight,
                            price: controller.cartItems[index].price,
                            controller: controller,
                          ),
                          const SizedBox(
                            height: 10,
                          )
                        ],
                      )));
            }),
          ),
        ],
      ),
    );
  }
}

class CartCard extends StatelessWidget {
  CartCard({
    super.key,
    required this.name,
    required this.weight,
    required this.price,
    required this.color,
    required this.controller,
  });
  final String name;
  final String weight;
  final int price;
  final String color;
  RxInt count = 0.obs;
  RxInt totalPrice = 0.obs;
  CartController controller;

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: 72,
                    width: 72,
                    decoration: BoxDecoration(
                      color: hexToColor(color),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SizedBox(
                    height: 72,
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
                          '$weight',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: ColorManager.text,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '\$ $price  ',
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            color: ColorManager.primary,
                            fontSize: 18,
                          ),
                        ),
                        Obx(() {
                          return Text(
                            'TotalPrice: \$ ${totalPrice.value}  ',
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: ColorManager.text,
                              fontSize: 12,
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      count.value > 0 ? count.value-- : null;
                      totalPrice.value =
                          controller.totalPrice(count.value, price);
                      controller.totalPriceForAllProducts >= price
                          ? controller.totalPriceForAllProducts -= price
                          : null;

                      controller.update();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xffB0EAFD),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.remove),
                    ),
                  ),
                  Obx(() {
                    return Text(
                      '${count.value}   ',
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: ColorManager.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    );
                  }),
                  InkWell(
                    onTap: () {
                      count.value++;
                      totalPrice.value =
                          controller.totalPrice(count.value, price);
                      controller.totalPriceForAllProducts += price;
                      controller.update();
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xffB0EAFD),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
