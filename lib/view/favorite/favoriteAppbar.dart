
  import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AppBar favoriteAppbar() {
    return AppBar(
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back_ios,
            ),
          ),
          centerTitle: true,
          title: Text(
            "Favorite",
            style: heading(20),
          ),
          backgroundColor: maincolor,
          elevation: 0);
  }