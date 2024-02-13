import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:flutter/material.dart';

Padding profileSave(MediaQueryData sizeof) {
  return Padding(
    padding: EdgeInsets.only(
        right: sizeof.size.width * 0.2, left: sizeof.size.width * 0.2),
    child: ElevatedButton(
      onPressed: () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        minimumSize: MaterialStateProperty.all(
          Size(sizeof.size.height * 0.52, sizeof.size.width * 0.14),
        ),
      ),
      child: Text(
        "Save",
        style: headingSecondstyling(20),
      ),
    ),
  );
}
