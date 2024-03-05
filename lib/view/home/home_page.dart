import 'package:bake_n_cake_user_side/controller/user_controller.dart';
import 'package:bake_n_cake_user_side/style/color.dart';

import 'package:bake_n_cake_user_side/view/home/appbar.dart';
import 'package:bake_n_cake_user_side/view/home/favoriteICon.dart';
import 'package:bake_n_cake_user_side/view/home/my_card.dart';
import 'package:bake_n_cake_user_side/view/productview/product_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.find<UserController>();
  @override
  void initState() {
    controller.getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizeof = MediaQuery.of(context);

    return Scaffold(
        backgroundColor: maincolor,
        appBar: CustomAppBar(),
        body: Obx(
          () {
            if (controller.productslist.isEmpty) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            return GridView.builder(
                itemCount: controller.productslist.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      child: GestureDetector(
                          onTap: () => Get.to(ProductView(index)),
                          child: myCard(sizeof, index)));
                });
          },
        ));
  }
}
