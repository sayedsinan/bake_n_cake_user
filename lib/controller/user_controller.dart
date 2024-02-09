import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  TextEditingController loginName = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  TextEditingController assurePassword = TextEditingController();
  TextEditingController signupEmail = TextEditingController();
  TextEditingController firstPassword = TextEditingController();

  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  signInwithField() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: loginName.text,
      password: loginPassword.text,
    );
  }

  signUp() async {}
}
