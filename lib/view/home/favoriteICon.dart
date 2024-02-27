import 'package:bake_n_cake_user_side/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

InkWell favoriteIcon(int index) {
  final controller = Get.find<UserController>();
  return InkWell(
    onTap: () {
      // Check if the item is in favorites
      bool isFavorite = controller.isFavorite(controller.productslist[index]);

      // If it is in favorites, remove it; otherwise, add it
      if (isFavorite) {
        controller.removefromfav(controller.productslist[index]);
      } else {
        controller.addtofavorite(controller.productslist[index]);
      }
    },
    child: Obx(() {
      bool isFavorite = controller.isFavorite(controller.productslist[index]);

      return Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.black,
      );
    }),
  );
}
