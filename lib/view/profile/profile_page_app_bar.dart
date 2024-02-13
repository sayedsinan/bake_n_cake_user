import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:flutter/material.dart';

class ProfilePageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfilePageAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(200);
  Widget build(BuildContext context) {
    var sizeof = MediaQuery.of(context);
    return AppBar(
      backgroundColor: Colors.white,
      centerTitle: true,
      leading: Icon(Icons.arrow_back_ios),
      title: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20,),
            Container(
              height: sizeof.size.height * 0.5,
              width: sizeof.size.width*0.3,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
