import 'package:demo/controller/favorits_controoler.dart';
import 'package:demo/core/utils/color_manager.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favorite extends GetView<FavoritController> {
  
  var searchController = TextEditingController();
  final controller = Get.put(FavoritController());

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(() {
        return ListView.builder(
            itemCount: controller.favoriteItems.length,
            itemBuilder: (context, index) {
              return Builder(builder: (context) {
                return Column(
                  children: [
                    FavoriteCard(
                      name: controller.favoriteItems[index].name,
                      noPieces: controller.favoriteItems[index].noPieces,
                      time: controller.favoriteItems[index].time,
                      newPrice: controller.favoriteItems[index].newPrice,
                      oldPrice: controller.favoriteItems[index].oldPrice,
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                );
              });
            });
      }),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  const FavoriteCard(
      {super.key,
      required this.name,
      required this.noPieces,
      required this.time,
      required this.oldPrice,
      required this.newPrice});
  final String name;
  final int noPieces;
  final int time;
  final int oldPrice;
  final int newPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Container(
        width: double.infinity,
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
                              onPressed: () {},
                              icon: const Icon(
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
