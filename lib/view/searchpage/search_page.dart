import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: maincolor,
      body: ListView(
        children: [
          Padding(
                  padding: const EdgeInsets.all(30),
                  child: TextField(
                    onChanged: (value) {
                      
                    },
                    decoration:  InputDecoration(
                      hintStyle: TextStyle(color: appbarColor),
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
