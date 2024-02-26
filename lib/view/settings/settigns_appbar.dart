import 'package:flutter/material.dart';
import 'package:bake_n_cake_user_side/style/color.dart';

class SettingsAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height *2);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: maincolor,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 25, // Increase the radius for a larger CircleAvatar
              backgroundImage: AssetImage(''), // Optionally provide a backgroundImage
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20,),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.location_history),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20,),
                    child: Text("Location"),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
