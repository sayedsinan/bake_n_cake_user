import 'package:bake_n_cake_user_side/controller/user_controller.dart';
import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(120); // Adjust the height as needed

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();
    return AppBar(
      backgroundColor: appbarColor,
      elevation: 0,
      centerTitle: true,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Hey",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(5),
          child: controller.img != null
              ? CircleAvatar(
                  radius: 30,
                  backgroundImage: MemoryImage(controller.img!),
                )
              : CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                      'https://www.google.com/url?sa=i&url=https%3A%2F%2Ficonduck.com%2Ficons%2F180867%2Fprofile-circle&psig=AOvVaw0vAwUDxdSK12Yd3DohOKHg&ust=1709098156538000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCMC39fXkyoQDFQAAAAAdAAAAABAK'),
                ),
        )
      ],
    );
  }
}
