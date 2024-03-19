import 'package:bake_n_cake_user_side/controller/payment_controller.dart';
import 'package:bake_n_cake_user_side/controller/user_controller.dart';
import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:bake_n_cake_user_side/view/cart/buttom.dart';
import 'package:bake_n_cake_user_side/view/productview/product_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key});

  @override
  Widget build(BuildContext context) {
    var sizeof = MediaQuery.of(context);
    final controller = Get.find<UserController>();

    // Calculate total sum
    double sum = 0.0;
    controller.cartItems.forEach((item) {
      sum += item.price;
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
        centerTitle: true,
        title: Text(
          "My Cart",
          style: heading(20),
        ),
      ),
      backgroundColor: maincolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // First ListView.builder for displaying the tiles
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: controller.cartItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Get.to(ProductView(index));
                    },
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      tileColor: secondColor,
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            controller.cartItems[index].image.toString()),
                      ),
                      title: Row(
                        children: [
                          Expanded(
                            child: Text(
                              controller.cartItems[index].name,
                              style: normalstyling(15),
                            ),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Container(
                              height: 25,
                              width: 20,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                  color: Colors.black,
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  controller.increment.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          SizedBox(width: sizeof.size.width * 0.02),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              color: Colors.grey[400],
                              height: 20,
                              width: 43,
                              child: Center(
                                child: Text(
                                  "${controller.kilo.toString()} KG",
                                  style: normalstyling(12),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: sizeof.size.width * 0.05),
                          Text(
                            "₹ ${controller.cartItems[index].price}",
                            style: normalstyling(15),
                          ),
                          SizedBox(width: sizeof.size.width * 0.26),
                          IconButton(
                            icon: Icon(
                              Icons.delete,
                              color: delete,
                            ),
                            onPressed: () {
                              int itemIndex = controller.cartItems
                                  .indexOf(controller.cartItems[index]);
                              controller.cartItems.removeAt(itemIndex);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: sizeof.size.height * 0.02),
            Divider(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: Text("Total"),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10, top: 20),
                  child: Text(sum.toString()),
                )
              ],
            ),
            SizedBox(height: sizeof.size.height * 0.1),
            // Pass sum to cartButton widget
            cartButton(sizeof, sum),
          ],
        ),
      ),
    );
  }
}

// Define cartButton widget
Widget cartButton(MediaQueryData sizeof, double totalAmount) {
  final paymentController = Get.find<PaymentController>();
  return ElevatedButton(
    onPressed: () {
      paymentController.openCheckout(totalAmount);
      // paymentController.addOrder();
    },
    child: Text(
      'Place Order',
      style: TextStyle(fontSize: 18),
    ),
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      primary: Colors.black,
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}

// Define handlePayment function
