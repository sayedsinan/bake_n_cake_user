import 'package:bake_n_cake_user_side/controller/user_controller.dart';
import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

Widget logo(BuildContext context) {
  final controller = Get.find<UserController>();
  return GestureDetector(
    onTap: () async {
      // Call the sign-in function when the logo is tapped
      try {
        await controller.signInWithGoogle();
        // Navigate to the next screen or perform other actions after successful sign-in
      } catch (e) {
        // Handle sign-in error
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error signing in with Google'),
          ),
        );
      }
    },
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(width: MediaQuery.of(context).size.width * 0.04),
        Container(
          height: MediaQuery.of(context).size.height * 0.06,
          color: Colors.red, // Replace with your color
          child: Image.asset('assets/google (2).png', fit: BoxFit.contain),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.04),
      ],
    ),
  );
}
