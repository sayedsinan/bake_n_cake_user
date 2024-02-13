import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:flutter/material.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(120); // Adjust the height as needed

  @override
  Widget build(BuildContext context) {
    // final sizeof = MediaQuery.of(context);
    return AppBar(
      backgroundColor: maincolor,
      elevation: 0,
      centerTitle: true,
      leading: Column(
        mainAxisAlignment:
            MainAxisAlignment.center, // Center the content vertically
        children: [
          Text(
            "Hey",
            style: normalstyling(20),
          ),
          SizedBox(
            height: 4,
          ),
          Text("Hey", style: heading(20)),
        ],
      ),
      actions: [Padding(
        padding: const EdgeInsets.all(12),
        child: CircleAvatar(),
      )],
    );
  }
}
