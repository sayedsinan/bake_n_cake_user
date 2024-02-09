import "package:bake_n_cake_user_side/style/color.dart";
import "package:bake_n_cake_user_side/style/text_style.dart";
import "package:flutter/material.dart";



AppBar appbar(MediaQueryData sizeof) {
    return AppBar(
      // toolbarHeight: sizeof.size.height*0.15,
      backgroundColor: maincolor,
      elevation: 0,
      leading: Row(
        children: [
          SizedBox(width: sizeof.size.width*0.05,),
          Icon(
            Icons.arrow_back_ios,
            color: secondColor,
          ),
          // SizedBox(width: sizeof.size.width*0.01,),
          Text("Back",style: normalstyling(15),)
        ],
      ),
    );
  }