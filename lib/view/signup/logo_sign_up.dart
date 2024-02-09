import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:flutter/material.dart';

Row logo(MediaQueryData sizeof) {
    return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: sizeof.size.width * 0.04,
            ),
            Container(
              
              height: sizeof.size.height * 0.06,
              color: maincolor,
              child: Image.asset('assets/google (2).png',fit: BoxFit.contain,),
            ),
            Container(
              height: sizeof.size.height * 0.06,
              color: maincolor,
              child: Image.asset('assets/google (2).png',fit: BoxFit.contain,)
            ),
            SizedBox(
              width: sizeof.size.width * 0.04,
            ),
          ],
        );
  }
