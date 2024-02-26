import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:bake_n_cake_user_side/view/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Padding editbutton(MediaQueryData sizeof) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ElevatedButton(
      onPressed: () {
        Get.to(ProfilePage());
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
        "Click to Edit",
        style: heading(15),
      ),
    ),
  );
}
