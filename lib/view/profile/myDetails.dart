import 'package:bake_n_cake_user_side/controller/user_controller.dart';
import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/style/text_style.dart';
import 'package:bake_n_cake_user_side/view/profile/edit_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';

class MyDetails extends StatelessWidget {
  const MyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();
    final currentUser = FirebaseAuth.instance.currentUser;
    var sizeof = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: maincolor,
      appBar: AppBar(
        backgroundColor: appbarColor,
        centerTitle: true,
        title: Text(
          "My Details",
          style: heading(
            20,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot>(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .doc(currentUser?.email)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }

            final userData = snapshot.data!.data() as Map<String, dynamic>;

            return Column(
              children: [
                SizedBox(height: sizeof.size.height * 0.07),
                   controller.img != null
                          ? CircleAvatar(
                              radius: 64,
                              backgroundImage: MemoryImage(controller.img!),
                            )
                          : CircleAvatar(
                              radius: 65,
                              backgroundImage: NetworkImage(''),
                            ),
                SizedBox(
                  height: sizeof.size.height * 0.03,
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Center(
                    child: Expanded(
                      child: Text(
                        userData['username'],
                        style: normalstyling(20),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 15,
                  color: Colors.black,
                ),
                ListTile(
                  leading: Icon(Icons.mobile_friendly),
                  title: Center(
                    child: Expanded(
                      child: Text(
                        userData['mobileNumber']??'add your number ',
                        style: normalstyling(20),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 15,
                  color: Colors.black,
                ),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Center(
                    child: Expanded(
                      child: Text(
                        userData['address']??'add tyou address manually',
                        style: normalstyling(20),
                      ),
                    ),
                  ),
                ),
                Divider(
                  height: 15,
                  color: Colors.black,
                ),
                ListTile(
                  leading: Icon(Icons.calendar_month),
                  title: Center(
                    child: Expanded(
                      child: Text(
                        userData['date of birth']??'add your date',
                        style: normalstyling(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: sizeof.size.height * 0.05,
                ),
                editbutton(sizeof)
              ],
            );
          },
        ),
      ),
    );
  }
}
