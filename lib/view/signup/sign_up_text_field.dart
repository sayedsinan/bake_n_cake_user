import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:flutter/material.dart';

Column signUpTextField() {
    return Column(
           children: [
             Padding(
                       padding: const EdgeInsets.all(30),
                       child: TextField(
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
       Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
        child: TextField(
          decoration: InputDecoration(
              labelText: 'Re-enter',
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
           ]);
  }