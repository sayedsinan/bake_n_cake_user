import 'dart:io';

import 'package:bake_n_cake_user_side/view/navigationbar/navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bake_n_cake_user_side/model/prodcuts.dart';
import 'package:firebase_storage/firebase_storage.dart'as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
    TextEditingController usernameController=TextEditingController();
   TextEditingController mobileNumberController=TextEditingController();
   TextEditingController addressController=TextEditingController();
   TextEditingController dobController=TextEditingController();

  TextEditingController loginName = TextEditingController();
  TextEditingController loginPassword = TextEditingController();
  TextEditingController assurePassword = TextEditingController();
  TextEditingController signupEmail = TextEditingController();
  TextEditingController firstPassword = TextEditingController();
  TextEditingController resetText = TextEditingController();
  RxList<ProductModel> productslist = <ProductModel>[].obs;
  RxList<ProductModel> cartItems = <ProductModel>[].obs;
  RxList<ProductModel> favoriteItems = <ProductModel>[].obs;
  RxList<ProductModel> originalProductsList = <ProductModel>[].obs;
  final userCollection = FirebaseFirestore.instance.collection("Users");
  final currentUser = FirebaseAuth.instance.currentUser;
    var profileImageUrl = ''.obs;
  signout() async {
    await FirebaseAuth.instance.signOut();
  }

  signInwithField() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: loginName.text,
      password: loginPassword.text,
    );
  }
 Future<String> updateProfileImageUrl(String profileImageUrl) async {
  try {
    final currentUser = FirebaseAuth.instance.currentUser;
    final docRef = FirebaseFirestore.instance
        .collection('Users')
        .doc(currentUser!.uid);

    // Get the current document data before updating
    final DocumentSnapshot<Map<String, dynamic>> docSnapshot = await docRef.get();

    // Update the profileImageUrl field
    await docRef.update({'profileImageUrl': profileImageUrl});

    // Get the updated profileImageUrl from the document snapshot
    final updatedData = docSnapshot.data();
    final updatedProfileImageUrl = updatedData?['profileImageUrl'] as String;

    // Return the updated profile image URL
    return updatedProfileImageUrl;
  } catch (e) {
    print('Error updating profile image URL: $e');
    // Return null or an empty string in case of an error
    return '';
  }
}

  signUp() async {
    try {
      var usersCollection =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: signupEmail.text,
        password: firstPassword.text,
      );

      FirebaseFirestore.instance
          .collection("Users")
          .doc(usersCollection.user!.email)
          .set({
        'username': signupEmail.text.split("@")[0],
        'mobileNumber': 'empty',
        'address': '',
        'date of birth': ''
      });

      Get.offAll(LandingPage());
    } catch (error) {
      // print(error);
    }
  }

  edit(String field) async {
    String newvalue = '';
    await userCollection.doc(currentUser?.email).update({field: newvalue});
  }

  reset() async {
    await FirebaseAuth.instance.sendPasswordResetEmail(
      email: resetText.text,
    );
  }

  Future<void> getProducts() async {
    try {
      CollectionReference products =
          FirebaseFirestore.instance.collection('product');
      QuerySnapshot querySnapshot = await products.get();
      List<ProductModel> productList = querySnapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return ProductModel.fromJson(data, doc.id); // pass the document ID
      }).toList();

      productslist.assignAll(productList);
      // print('Products: $productslist');
      originalProductsList.assignAll(productslist);
    } catch (e) {
      // print('Error fetching products: $e');
    }
  }

  void addToCart(ProductModel product) {
    cartItems.add(product);
  }

  void addtofavorite(ProductModel product) {
    favoriteItems.add(product);
  }
   bool isFavorite(ProductModel product) {
    return favoriteItems.contains(product);
  }

  void removefromfav(ProductModel product) {
    favoriteItems.remove(product);
  }

  double sum = 0.0;
  void sumofProducts() {
    // ignore: avoid_function_literals_in_foreach_calls
    cartItems.forEach((item) {
      sum += item.price;
    });
  }

  void removeItem(item) {
    cartItems.removeWhere((element) => element == item);
  }
}
