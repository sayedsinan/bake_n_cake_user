import 'package:bake_n_cake_user_side/controller/meseage_controller.dart';
import 'package:bake_n_cake_user_side/controller/payment_controller.dart';
import 'package:bake_n_cake_user_side/controller/user_controller.dart';
import 'package:bake_n_cake_user_side/controller/wrapper.dart';
import 'package:bake_n_cake_user_side/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.put(UserController());
  Get.put(MesseageController());
  Get.put(PaymentController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Wrapper(),
    );
  }
}
