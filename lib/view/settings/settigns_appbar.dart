import 'package:bake_n_cake_user_side/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:get/get.dart';

class SettingsAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height * 2);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();
    return AppBar(
      backgroundColor: maincolor,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: controller.img != null
                ? CircleAvatar(
                    radius: 30,
                    backgroundImage: MemoryImage(controller.img!),
                  )
                : CircleAvatar(
                   radius: 30,
                    backgroundImage: NetworkImage('https://www.google.com/url?sa=i&url=https%3A%2F%2Ficonduck.com%2Ficons%2F180867%2Fprofile-circle&psig=AOvVaw0vAwUDxdSK12Yd3DohOKHg&ust=1709098156538000&source=images&cd=vfe&opi=89978449&ved=0CBMQjRxqFwoTCMC39fXkyoQDFQAAAAAdAAAAABAK'),
                  ),
          ),
      
        ],
      ),
    );
  }
}
