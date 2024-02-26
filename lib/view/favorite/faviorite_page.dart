import 'package:bake_n_cake_user_side/controller/user_controller.dart';
import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavioratePage extends StatelessWidget {
  const FavioratePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.find<UserController>();
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: ListView.builder(
                  itemCount:controller.favoriteItems.length ,
                  itemBuilder: (context, index) {
                  return ListTile(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    tileColor: Colors.white,
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            controller.favoriteItems[index].image.toString()),
                      ),
                    title: Expanded(child: Text(controller.favoriteItems[index].name,)),
                    trailing: Icon(Icons.favorite_border),
                  );
                }), 
              )
            ],
          ),
        ));
  }
}
