import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:flutter/material.dart';

class FavioratePage extends StatelessWidget {
  const FavioratePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: maincolor,
        appBar: AppBar(
            leading: Icon(
              Icons.arrow_back_ios,
            ),
            centerTitle: true,
            title: Text(
              "Favorite",
              style: heading(20),
            ),
            backgroundColor: maincolor,
            elevation: 0),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: ListTile(
                shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(15)),
                tileColor: Colors.white,
             leading: CircleAvatar()
             ,title: Text("cake name"),
             trailing: Icon(Icons.favorite_border),
              ),
              
            )
          ],
        ));
  }
}
