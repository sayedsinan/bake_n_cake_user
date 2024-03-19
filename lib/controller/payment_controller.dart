import 'package:bake_n_cake_user_side/model/orders.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_web/razorpay_web.dart';

class PaymentController extends GetxController {
  final database = FirebaseFirestore.instance;
  late Razorpay _razorpay;

  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _errorHandler);
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _successHandler);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _externalWalletHandler);
  }

  void _errorHandler(PaymentFailureResponse response) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: Text(response.message!),
      backgroundColor: Colors.red,
    ));
  }

  void _successHandler(PaymentSuccessResponse response) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: Text(response.paymentId!),
      backgroundColor: Colors.green,
    ));
  }

  void _externalWalletHandler(ExternalWalletResponse response) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(SnackBar(
      content: Text(response.walletName!),
      backgroundColor: Colors.green,
    ));
  }

  void openCheckout(double amount) {
    var options = {
      "key": "rzp_test_mO98XIbXzmiLjr",
      "amount": amount * 100, // amount in paise
      "name": "Test",
      "description": "This is a test payment",
      "timeout": "180",
      "currency": "INR",
      "prefill": {
        "contact": "+91 8086356955",
        "email": "test@abc.com",
      }
    };
    _razorpay.open(options);
  }

  @override
  void onClose() {
    _razorpay.clear(); // Clear the Razorpay instance when the controller is closed
    super.onClose();
  }

  void handlePayment(
      String productName, String customerName, String paymentStatus,int kg) async {
    // After payment is successful, add order to Firebase
    final order = ProductOrder(
      kg: kg,
      productName: productName,
      customerName: customerName,
      paymentStatus: paymentStatus,
    );
    await addOrder(order);
  }

  Future<void> addOrder(ProductOrder order) async {
    try {
      await database
          .collection('Orders')
          .add(order.toMap()); // Use collection method from FirebaseFirestore
    } catch (e) {
      // Handle error
      print('Error adding order: $e');
    }
  }
}
