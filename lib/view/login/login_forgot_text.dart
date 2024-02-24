import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:bake_n_cake_user_side/view/forgot/forgot_page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Row forgot() {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "Forgot password?",
        style: normalstyling(15),
      ),
      const SizedBox(
        width: 5,
      ),
      GestureDetector(
        onTap: () {
          Get.to(ForgotPage());
        },
        child: Text(
          "Reset",
          style: normalstyling(15),
        ),
      )
    ],
  );
}
