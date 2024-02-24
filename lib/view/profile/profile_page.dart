import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/view/profile/profile_details.dart';
import 'package:bake_n_cake_user_side/view/profile/profile_page_app_bar.dart';
import 'package:bake_n_cake_user_side/view/profile/profile_save.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
    var sizeof = MediaQuery.of(context);
    return Scaffold(
      appBar: ProfilePageAppBar(),
      backgroundColor: maincolor,
      body: SingleChildScrollView(
        child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection("Users")
                .doc(currentUser?.email)
                .snapshots(),
            builder: (context, snapshot) {
              // if (snapshot.hasData && currentUser != null) {
                // final userData =
                //     snapshot.data!.data() as Map<String, dynamic>;
                // Check if the user data contains the key before assigning
                // if (userData.containsKey('username')) {
                //   usernameController.text = userData['username'];
                // }
                // if (userData.containsKey('mobileNumber')) {
                //   mobileNumberController.text = userData['mobileNumber'];
                // }
                // if (userData.containsKey('address')) {
                //   addressController.text = userData['address'];
                // }
                // if (userData.containsKey('date of birth')) {
                //   dobController.text = userData['date of birth'];
                // }
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: TextField(
                        onChanged: (newValue) =>
                            edit('username', newValue),
                        controller: usernameController,
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
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 30),
                      child: TextField(
                        onChanged: (newValue) =>
                            edit('mobileNumber', newValue),
                        controller: mobileNumberController,
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
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 30),
                      child: TextField(
                        onChanged: (newValue) => edit('address', newValue),
                        controller: addressController,
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
                      padding: const EdgeInsets.only(
                          left: 30, right: 30, bottom: 30),
                      child: TextField(
                        onChanged: (newValue) =>
                            edit('date of birth', newValue),
                        controller: dobController,
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
              // } else if (snapshot.hasError) {
              //   return Center(
              //     child: Text("Error"),
              //   );
              // }
              // return Center(
              //   child: CircularProgressIndicator(),
              // );
            }),
      ),
    );
  }
}
