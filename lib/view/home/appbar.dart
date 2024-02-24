import 'package:bake_n_cake_user_side/style/color.dart';
import'package:flutter/material.dart';
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {

  @override
  Size get preferredSize => Size.fromHeight(120); // Adjust the height as needed

  @override
  Widget build(BuildContext context) {
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
          child: CircleAvatar(
            backgroundColor: Colors.red,
          ),
        )
      ],
    );
  }
}
