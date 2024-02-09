import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:bake_n_cake_user_side/view/signup/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Row text(MediaQueryData sizeof) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Don't have an account?",
        style: normalstyling(15),
      ),
      SizedBox(
        height: sizeof.size.width * 0.02,
      ),
      TextButton(
  onPressed: () => Get.to(() => const SignUp(tag: "SignUp",)),
  child: Hero(
    tag: "SignUp", 
    child: Text(
      "Sign Up",
      style: normalstyling(15),
    ),
  ),
)

    ],
  );
}
