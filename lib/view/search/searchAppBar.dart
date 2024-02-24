
import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:flutter/material.dart';


  AppBar searchapp() {
    return AppBar(
      centerTitle: true,
      backgroundColor: appbarColor,
      title:Text("Search page",style: heading(25),),
    );
  }
