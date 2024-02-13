import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:flutter/material.dart';


Column login() {
  // final controller =Get.put(UserController);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "continue ordering",
              style: normalstyling(13),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(30),
          child: TextField(
            // controller: controller.loginName,
            decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: textColor),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
                prefixIcon: Icon(
                  Icons.email,
                  color: textColor,
                )),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
          child: TextField(
            // controller: controller.loginPassword,
            decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: textColor),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
                prefixIcon: Icon(
                  Icons.lock,
                  color: textColor,
                ),
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                  color: textColor,
                )),
          ),
        ),
      ],
    );
  }