import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:flutter/material.dart';

Padding cartButton(MediaQueryData sizeof) {
    return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(textColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              minimumSize: MaterialStateProperty.all(
                Size(sizeof.size.height * 0.52, sizeof.size.width * 0.14),
              ),
            ),
            child: Text("Order",style: normalsecondStyling(15),),
          ),
        );
  }
