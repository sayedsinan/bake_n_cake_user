import 'package:bake_n_cake_user_side/controller/user_controller.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:bake_n_cake_user_side/view/home/favoriteICon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Card myCard(MediaQueryData sizeof, int index) {
  final controller = Get.find<UserController>();
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
            child: SizedBox(
                width: sizeof.size.width * 1,
                child: Image.network(
                  controller.productslist[index].image.toString(),
                  fit: BoxFit.cover,
                )),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: sizeof.size.width * 0.03,
            ),
            Expanded(
              child: Text(
                controller.productslist[index].name,
                style: normalstyling(15),
              ),
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
                "₹ ${controller.productslist[index].price}".toString(),
                style: normalstyling(15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: favoriteIcon(index),
            )
          ],
        )
      ],
    ),
  );
}
