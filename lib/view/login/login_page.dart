import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:bake_n_cake_user_side/view/login/forgot_text.dart';
import 'package:bake_n_cake_user_side/view/login/login_feild.dart';
import 'package:bake_n_cake_user_side/view/login/login_forgot_text.dart';
import 'package:bake_n_cake_user_side/view/login/logo.dart';
import 'package:bake_n_cake_user_side/view/login/logo_button.dart';


import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeof = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: maincolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SafeArea(
                child: Text(
                  "Log in to your account",
                  style: heading(25),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            "Good to see you again, enter your details below to ",
            style: normalstyling(13),
          ),
          login(),
          const SizedBox(
            height: 5,
          ),
         forgot(),
          SizedBox(
            height: sizeof.size.height * 0.06,
          ),
          logo(sizeof),
          SizedBox(
            height: sizeof.size.width * 0.49,
          ),
          button(sizeof),
          text(sizeof)
        ],
      ),
    );
  }

}
