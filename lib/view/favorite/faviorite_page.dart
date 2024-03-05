import 'package:bake_n_cake_user_side/controller/user_controller.dart';
import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:bake_n_cake_user_side/view/favorite/favoriteAppbar.dart';
import 'package:bake_n_cake_user_side/view/favorite/my_tile.dart';
import 'package:bake_n_cake_user_side/view/productview/product_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavioratePage extends StatelessWidget {
  const FavioratePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: maincolor,
        appBar: favoriteAppbar(),
        body: GetBuilder<UserController>(builder: (controller) {
          return Column(
            children: [
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: controller.favoriteItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(20),
                      child: InkWell(
                        onTap:(){
                          Get.to(ProductView(index));
                        },
                        child: myTile(controller, index)),
                    );
                  })
            ],
          );
        }));
  }

}
