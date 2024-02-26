import 'package:bake_n_cake_user_side/controller/user_controller.dart';
import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductView extends StatelessWidget {
  const ProductView(this.index, {super.key});
  final int index;
  @override
  Widget build(BuildContext context) {
    var sizeof = MediaQuery.of(context);
    final controller = Get.find<UserController>();
    return Scaffold(
        backgroundColor: maincolor,
        appBar: myappbar(),
        body: Obx(() {
          return ListView(
            children: [
              SizedBox(
                height: sizeof.size.height * 0.05,
              ),
              image(sizeof),
              SizedBox(
                height: sizeof.size.height * 0.04,
              ),
              cakename(),
              SizedBox(
                height: sizeof.size.height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      color: Colors.white,
                      height: sizeof.size.height * 0.05,
                      width: sizeof.size.width * 0.3,
                      child: Center(
                          child: Text(
                         "₹ ${controller.productslist[index].price}",
                        style: normalstyling(25),
                      )),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: sizeof.size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: sizeof.size.width * 0.1,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: InkWell(
                          onTap: (){
                             controller.addToCart(controller.productslist[index]);
                              Get.snackbar(
                            'Added to Cart',
                            'The product has been added to the cart.',
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.black,
                            colorText: Colors.white,
                          );
                          },
                          child: Container(
                              color: Colors.grey[400],
                              width: sizeof.size.width * 0.3,
                              height: sizeof.size.width * 0.1,
                              child: Center(
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.shopping_cart,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Add to Cart")
                                  ],
                                ),
                              )),
                        ),
                      ),
                      SizedBox(
                        width: sizeof.size.width * 0.2,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Container(
                            color: Colors.black,
                            width: sizeof.size.width * 0.3,
                            height: sizeof.size.width * 0.1,
                            child: Center(
                              child: Row(
                                children: [
                                  Text("Buy now",
                                      style: normalsecondStyling(15)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(Icons.arrow_forward, color: secondColor),
                                ],
                              ),
                            )),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: sizeof.size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text("Description")],
              ),
              Divider(
                color: Colors.black,
                height: 10,
              ),
              Row(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(controller.productslist[index].description),
                ],
              )
            ],
          );
        }));
  }

  Row cakename() {
        final controller = Get.find<UserController>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          controller.productslist[index].name,
          style: heading(20),
        )
      ],
    );
  }

  Row image(MediaQueryData sizeof) {
        final controller = Get.find<UserController>();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
              child: Image.network(
              controller.productslist[index].image.toString(),
                fit: BoxFit.fill,
              ),
              height: sizeof.size.height * 0.45,
              width: sizeof.size.width * 0.8),
        )
      ],
    );
  }

  AppBar myappbar() {
    return AppBar(
      backgroundColor: maincolor,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),
    );
  }
}
