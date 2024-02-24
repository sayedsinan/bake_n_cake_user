import 'package:bake_n_cake_user_side/controller/user_controller.dart';
import 'package:bake_n_cake_user_side/view/profile/profile_page.dart';
import 'package:bake_n_cake_user_side/view/settings/settigns_appbar.dart';
import 'package:flutter/material.dart';
import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();
    var sizeof = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: maincolor,
      appBar: SettingsAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // SizedBox(height: sizeof.size.height*0.1,),
            Padding(
              padding: EdgeInsets.only(
                  bottom: sizeof.size.height * 0.02,
                  top: sizeof.size.height * 0.02),
              child: InkWell(
onTap:(){
  Get.to(ProfilePage());
}
             ,   child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text("Personal Info"),
                  trailing: Icon(Icons.arrow_forward_ios_sharp),
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: sizeof.size.height * 0.02,
                  top: sizeof.size.height * 0.02),
              child: ListTile(
                leading: Icon(Icons.add_box),
                title: Text("My Orders"),
                trailing: Icon(Icons.arrow_forward_ios_sharp),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: sizeof.size.height * 0.02,
                  top: sizeof.size.height * 0.02),
              child: ListTile(
                leading: Icon(Icons.payments),
                title: Text("Payment methods"),
                trailing: Icon(Icons.arrow_forward_ios_sharp),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: sizeof.size.height * 0.02,
                  top: sizeof.size.height * 0.02),
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text("Invite a Friend"),
                trailing: Icon(Icons.arrow_forward_ios_sharp),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: sizeof.size.height * 0.02,
                  top: sizeof.size.height * 0.02),
              child: ListTile(
                leading: Icon(Icons.chat_rounded),
                title: Text("Chat support"),
                trailing: Icon(Icons.arrow_forward_ios_sharp),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Padding(
              padding: EdgeInsets.only(
                  bottom: sizeof.size.height * 0.02,
                  top: sizeof.size.height * 0.02),
              child: InkWell(
                onTap: () {
                  controller.signout();
                },
                child: ListTile(
                  leading: Icon(Icons.login_outlined),
                  title: Text("Log Out"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
