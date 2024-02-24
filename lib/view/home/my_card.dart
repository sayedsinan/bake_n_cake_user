import 'package:bake_n_cake_user_side/controller/user_controller.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

Card homeCard(MediaQueryData sizeof, int index) {
  final UserController controller = Get.find<UserController>();

  if (controller.productslist.isEmpty) {
    // Handle empty state or display a placeholder
    return Card();
  }

  // Check if the index is within the bounds of the productslist
  if (index < controller.productslist.length) {
    final product = controller.productslist[index];
    return Card(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Container(
              height: sizeof.size.height * 0.119,
              color: Colors.black,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: sizeof.size.width * 0.03,
              ),
              Text(
                product.name,
                style: normalstyling(15),
              ),
            ],
          ),
          SizedBox(
            width: sizeof.size.height * 0.04,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: sizeof.size.width * 0.03,
              ),
              Expanded(
                child: Text(
                  "Price: ${product.price}",
                  style: normalstyling(15),
                ),
              ),
            ],
          )
        ],
      ),
    );
  } else {
    // Handle out-of-bounds index
    return Card();
  }
}
