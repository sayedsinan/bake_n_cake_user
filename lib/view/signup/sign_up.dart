import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:bake_n_cake_user_side/view/login/logo.dart';
import 'package:bake_n_cake_user_side/view/signup/divider.dart';
import 'package:bake_n_cake_user_side/view/signup/sign_up_app_bar.dart';
import 'package:bake_n_cake_user_side/view/signup/sign_up_button.dart';
import 'package:bake_n_cake_user_side/view/signup/sign_up_text_field.dart';
import 'package:bake_n_cake_user_side/view/signup/text_accout.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key, required this.tag});
  final String tag;

  @override
  Widget build(BuildContext context) {
    var sizeof = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: maincolor,
      appBar: appbar(sizeof),
      body: Column(
        children: [
          SizedBox(
            width: sizeof.size.width * .01,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                tag: tag,
                child: Text(
                  "Create an account",
                  style: heading(20),
                ),
              ),
            ],
          ),
          SizedBox(
            height: sizeof.size.height * .01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter your personal information",
                style: normalstyling(15),
              ),
            ],
          ),
          signUpTextField(),
          signupButton(sizeof),
          SizedBox(
            height: sizeof.size.height * 0.05,
          ),
          divider(),
          SizedBox(height: sizeof.size.height * 0.03),
          logo(sizeof),
          SizedBox(height: sizeof.size.height * 0.03),
          signinForgot()
        ],
      ),
    );
  }
}
