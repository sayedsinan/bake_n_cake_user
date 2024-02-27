import 'package:bake_n_cake_user_side/controller/user_controller.dart';
import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Padding profileSave(MediaQueryData sizeof) {
  final controller = Get.find<UserController>();
  return Padding(
    padding: EdgeInsets.only(
        right: sizeof.size.width * 0.2, left: sizeof.size.width * 0.2),
    child: ElevatedButton(
      onPressed: () {
        controller.saveimage();
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          Size(sizeof.size.height * 0.52, sizeof.size.width * 0.14),
        ),
      ),
      child: Text(
        "Save",
        style: headingSecondstyling(20),
      ),
    ),
  );
}
