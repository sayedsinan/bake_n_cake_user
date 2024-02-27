import 'package:bake_n_cake_user_side/controller/user_controller.dart';
import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/view/profile/profile_save.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final currentUser = FirebaseAuth.instance.currentUser;
  late TextEditingController usernameController;
  late TextEditingController mobileNumberController;
  late TextEditingController addressController;
  late TextEditingController dobController;

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    mobileNumberController = TextEditingController();
    addressController = TextEditingController();
    dobController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    mobileNumberController.dispose();
    addressController.dispose();
    dobController.dispose();
    super.dispose();
  }

  void edit(String field, String newValue) async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(currentUser?.email)
        .update({field: newValue});
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<UserController>();
    var sizeof = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: maincolor,
      ),
      backgroundColor: maincolor,
      body: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Users")
                .doc(currentUser?.email)
                .snapshots(),
            builder: (context, snapshot) {
             
              return Column(
                children: [
                  Stack(
                    children: [
                      controller.img != null
                          ? CircleAvatar(
                              radius: 64,
                              backgroundImage: MemoryImage(controller.img!),
                            )
                          : CircleAvatar(
                              radius: 65,
                              backgroundImage: NetworkImage(''),
                            ),
                      Positioned(
                          child: IconButton(
                            onPressed: () {
                              controller.selectImage();
                            },
                            icon: Icon(
                              Icons.add_a_photo,
                            ),
                          ),
                          bottom: -10,
                          left: 80)
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: TextField(
                      onChanged: (newValue) => edit('username', newValue),
                      controller: controller.usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: textColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                    child: TextField(
                      onChanged: (newValue) => edit('mobileNumber', newValue),
                      controller: controller.mobileNumberController,
                      decoration: InputDecoration(
                        labelText: 'Mobile Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: textColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                    child: TextField(
                      onChanged: (newValue) => edit('address', newValue),
                      controller: controller.addressController,
                      decoration: InputDecoration(
                        labelText: 'Address',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: textColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                    child: TextField(
                      onChanged: (newValue) => edit('date of birth', newValue),
                      controller: controller.dobController,
                      decoration: InputDecoration(
                        labelText: 'Date of Birth',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: textColor),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20.0)),
                        ),
                      ),
                    ),
                  ),
                  profileSave(sizeof)
                ],
              );
            }),
      ),
    );
  }
}
