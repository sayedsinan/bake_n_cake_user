import 'package:bake_n_cake_user_side/controller/user_controller.dart';
import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Padding signupButton(MediaQueryData sizeof) {
  final controller = Get.find<UserController>();
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      onPressed: () {
        controller.signUp();
        // Get.off(() => const HomeScreen());
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
        minimumSize: MaterialStateProperty.all(
          Size(sizeof.size.height * 0.52, sizeof.size.width * 0.14),
        ),
      ),
      child: Text(
        "Sign Up",
        style: headingSecondstyling(20),
      ),
    ),
  );
}
