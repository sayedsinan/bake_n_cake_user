
import 'package:bake_n_cake_user_side/controller/meseage_controller.dart';
import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = Get.find<MesseageController>();
    final secondcontroller = Get.find<MesseageController>();

    return Scaffold(
      backgroundColor: maincolor,
        appBar: AppBar(
          backgroundColor: appbarColor,
          leading: null,
          centerTitle: true,
          title: Text("Bake'n Cake",style: heading(20),),
        ),
        body:   GetBuilder<MesseageController>(
          builder: (builder ) {
            return Column(
                children: [
                  Expanded(child: secondcontroller.buildeMesseageList()),
                  secondcontroller.builtMesseageInput()
                ],
              );
          }
        
        )
        );
  }
}
 