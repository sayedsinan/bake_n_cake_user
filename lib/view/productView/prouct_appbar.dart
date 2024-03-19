import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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