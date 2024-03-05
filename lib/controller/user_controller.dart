import 'dart:typed_data';

import 'package:bake_n_cake_user_side/view/login/login_page.dart';
import 'package:bake_n_cake_user_side/view/navigationbar/navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bake_n_cake_user_side/model/prodcuts.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
class UserController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dobController = TextEditingController();
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
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;
  final currentUser = FirebaseAuth.instance.currentUser;
  Uint8List? img;
  RxInt increment = 1.obs;
  RxInt kilo = 1.obs;



  void selectDate(DateTime selectedDate) {
    final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
    dobController.text = formattedDate;
  }


  void productincrement() {
    increment++;
  }

  Future<String> uploadImageToStorage(String childname, Uint8List file) async {
    Reference ref = storage.ref().child(childname);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snapshot = await uploadTask;
    String download = await snapshot.ref.getDownloadURL();
    return download;
  }

  saveimage() async {
    final resp = await savePhoto(image: img!);
  }

  void kgincrement() {
    kilo++;
  }

  void kgdecrement() {
    kilo--;
  }

  Future<String> savePhoto({
    required Uint8List image,
  }) async {
    String resp = "Some error";
    try {
      String imageUrl = await uploadImageToStorage('profileimage', image);
      await firestore.collection('Users').add({'imageLink': imageUrl});
      resp = 'success';
    } catch (e) {
      resp = e.toString();
    }
    return resp;
  }

  void decrement() {
    increment--;
  }

  signout() async {
    await FirebaseAuth.instance.signOut();
    Get.to(()=> const Login());
  }

  signInwithField() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: loginName.text,
      password: loginPassword.text,
    );
  }

  pickImage(ImageSource source) async {
    final ImagePicker imagePicker = ImagePicker();
    XFile? file = await imagePicker.pickImage(source: source);
    if (file != null) {
      return await file.readAsBytes();
    }
    print('$source');
  }

  void selectImage() async {
    Uint8List img1 = await pickImage(ImageSource.gallery);
    img = img1;
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
        'date of birth': '',
        'image': ''
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
