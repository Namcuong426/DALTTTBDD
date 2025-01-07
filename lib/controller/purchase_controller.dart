import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../model/user/user.dart';
import 'login_controller.dart';

class PurchaseController extends GetxController{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference orderCollection;

  TextEditingController addresController = TextEditingController();

  double orderPirce = 0;
  String itemName = '';
  String orderAddress = '';

  @override
  void onInit() {
    orderCollection = firestore.collection('orders');
    super.onInit();
  }

  submitOrder({
    required double price,
    required String item,
    required String descriton,}){

    orderPirce = price;
    itemName = item;
    orderAddress = addresController.text;
    print('$orderPirce $itemName $orderPirce');

    Razorpay razorpay =Razorpay();

    var options = {
      'key': '<YOUR_KEY_HERE>',
      'amount': price ,
      'name': item,
      'description': descriton,
    };

   /* _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    __razorpay.open(options)*/

    void _handlePaymentSuccess(PaymentSuccessResponse response) {

      Get.snackbar('Thanh toán', 'Thanh toan thanh công', colorText: Colors.green);
    }

    void _handlePaymentError(PaymentFailureResponse response) {
      Get.snackbar('Thanh toán', 'Thanh toan thanh công', colorText: Colors.red);
    }

    Future<void> orderSuccess({required String? transactionId}) async {
      User? loginUse = Get.find<LoginController>().loginUser;
      try {
        if (transactionId != null) {
          DocumentReference docRef = await orderCollection.add({
            'customer': loginUse?.name ?? '',
            'phone': loginUse?.number ?? '',
            'item': itemName,
            'price': orderPirce,
            'address': orderAddress,
            'transactionId': transactionId,
            'dateTime': DateTime.now().toString(),
          });
          print("Order Created Successfully: ${docRef.id}");
          Get.snackbar('Đặt hàng', 'Đặt hàng thanh công', colorText: Colors.green);
        }
        else{
          Get.snackbar('Lỗi', 'Đặt hàng thất bại', colorText: Colors.red);
        }
      } catch (e) {
        print("Error creating order: $e");
        Get.snackbar('Lỗi', 'Thao ', colorText: Colors.green);
      }
    }

  }


}