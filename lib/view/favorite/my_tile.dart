import 'package:bake_n_cake_user_side/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

ListTile myTile(UserController controller, int index) {
    return ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                          side: BorderSide(color: Colors.black),
                        ),
                        tileColor: Colors.white,
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(controller
                              .favoriteItems[index].image
                              .toString()),
                        ),
                        title: Text(
                          controller.favoriteItems[index].name,
                        ),
                        trailing: InkWell(
                          onTap: () {
                            // Check if the item is in favorites
                            bool isFavorite = controller
                                .isFavorite(controller.productslist[index]);

                            // If it is in favorites, remove it; otherwise, add it
                            if (isFavorite) {
                              controller.removefromfav(
                                  controller.productslist[index]);
                            } else {
                              controller.addtofavorite(
                                  controller.productslist[index]);
                            }
                          },
                          child: Obx(() {
                            bool isFavorite = controller
                                .isFavorite(controller.productslist[index]);

                            return Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorite ? Colors.red : Colors.black,
                            );
                          }),
                        ));
  }

