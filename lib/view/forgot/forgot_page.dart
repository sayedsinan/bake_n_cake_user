import 'package:bake_n_cake_user_side/controller/user_controller.dart';
import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:bake_n_cake_user_side/view/forgot/forgot_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPage extends StatelessWidget {
  const ForgotPage({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeof = MediaQuery.of(context);
    final controller = Get.find<UserController>();
    return Scaffold(
      backgroundColor: maincolor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 300,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Text("Enter your mail",style: normalstyling(30),)],
            ),
            Padding(
              padding: const EdgeInsets.all(30),
              child: TextField(
                controller: controller.resetText,
                decoration: InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: textColor),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(20.0)),
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      color: textColor,
                    )),
              ),
            ),
            forgotbutton(sizeof),
          ],
        ),
      ),
    );
  }
}
