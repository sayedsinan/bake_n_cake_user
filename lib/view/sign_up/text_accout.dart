import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:bake_n_cake_user_side/view/login/login_page.dart';
import 'package:flutter/material.dart';

Row signinForgot() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account ?",
          style: normalstyling(15),
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: ()=>const Login(),
          child: Text(
            "Sign in",
            style: normalstyling(15),
          ),
        )
      ],
    );
  }