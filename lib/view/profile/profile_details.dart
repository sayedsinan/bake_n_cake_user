import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:flutter/material.dart';

Column accountSetup() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: TextField(
            decoration: InputDecoration(
                labelText: 'Mobile number',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: textColor),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
          child: TextField(
            decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: textColor),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
                
               ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
          child: TextField(
            decoration: InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: textColor),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
               ),
          ),
        ),
          Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
          child: TextField(
            decoration: InputDecoration(
                labelText: 'Date of birth',
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: textColor),
                  borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                ),
               ),
          ),
        ),
      ],
    );
  }