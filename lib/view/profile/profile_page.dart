import 'package:bake_n_cake_user_side/style/color.dart';
import 'package:bake_n_cake_user_side/view/profile/profile_details.dart';
import 'package:bake_n_cake_user_side/view/profile/profile_page_app_bar.dart';
import 'package:bake_n_cake_user_side/view/profile/profile_save.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    var sizeof = MediaQuery.of(context);
    return Scaffold(
      appBar: ProfilePageAppBar(),
      backgroundColor: maincolor,
      body: Column(
        children: [accountSetup(), profileSave(sizeof)],
      ),
    );
  }
}
