import 'package:bake_n_cake_user_side/style/text_style.dart';

import 'package:flutter/material.dart';

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
        Text(
          "Reset",
          style: normalstyling(15),
        )
      ],
    );
  }