import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfilePageAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(200);
  Widget build(BuildContext context) {
    var sizeof = MediaQuery.of(context);
    return AppBar(
        backgroundColor: appbarColor,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          "My Details",
          style: heading(20),
        ));
  }
}
