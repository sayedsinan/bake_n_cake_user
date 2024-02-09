 import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:flutter/material.dart';

Card homeCard(MediaQueryData sizeof) {
    return Card(
      child: Column(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
            child: Container(
              height: sizeof.size.height * 0.119,
              color: Colors.black,
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: sizeof.size.width * 0.03,
              ),
              Expanded(
                child: Text(
                  "Cake",
                  style: normalstyling(15),
                ),
              ),
            
            ],
          ),
            SizedBox(
                width: sizeof.size.height * 0.04,
              ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: sizeof.size.width * 0.03,
              ),
              Expanded(
                child: Text(
                  "Price",
                  style: normalstyling(15),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }