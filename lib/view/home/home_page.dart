import 'package:bake_n_cake_user_side/controller/user_controller.dart';
import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:bake_n_cake_user_side/view/home/appbar.dart';
import 'package:bake_n_cake_user_side/view/home/my_card.dart';
import 'package:bake_n_cake_user_side/view/productView/product_view.dart';
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
                          child: Card(
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
                                      controller.productslist[index].image
                                          .toString(),
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
                                        controller.productslist[index].price
                                            .toString(),
                                        style: normalstyling(15),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )));
                });
          },
        ));
  }
}
