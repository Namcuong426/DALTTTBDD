import 'dart:math';

import 'package:app_client/model/user/user.dart';
import 'package:app_client/view/home/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';

class LoginController extends GetxController{

  GetStorage box = GetStorage();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference userCollection;

  TextEditingController registerNameCtrl = TextEditingController();
  TextEditingController PhoneNumberCtrl = TextEditingController();

  TextEditingController loginPhoneNumberCtrl = TextEditingController();

  OtpFieldControllerV2 otpController = OtpFieldControllerV2();
  bool otpFieldShown = false;
  int? otpSend;
  int? otpEnter;

  User? loginUser;


  @override
  void onReady() {
    Map<String, dynamic>? user = box.read('loginUser');
    if(user != null){
      loginUser = User.fromJson(user);
      Get.to(const HomePage());
    }else{

    }
    super.onReady();
  }

  @override
  void onInit() {
    userCollection = firestore.collection('users');
    super.onInit();
  }



  addUser(){
    try {
     /* if (registerNameCtrl.text.isEmpty || PhoneNumberCtrl.text.isEmpty) {
        Get.snackbar(
          'Error',
          'Hãy nhập đầy đủ thông tin',
          colorText: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
        );
        return ; // Explicitly return here to avoid incomplete execution
      }*/
      if(otpSend == otpEnter){
        DocumentReference doc  = userCollection.doc();
        User user = User(
          id:doc.id,
          name: registerNameCtrl.text,
          number: PhoneNumberCtrl.text,
        );
        final ueerJson = user.toJson();
        doc.set(ueerJson);
        Get.snackbar('Success', 'Đã thêm tài khoản thành công', colorText: Colors.green);
        PhoneNumberCtrl.clear();
        registerNameCtrl.clear();
        otpController.clear();
      }else{
        Get.snackbar('Error', 'Chưa có OTP', colorText: Colors.red);
      }

    } catch (e) {

      print(e);
    }
  }

  sendOtp(){
    try {

      final random = Random(); // Sửa tên biến
      int otp = 1000 + random.nextInt(9000);
      print(otp);
      if(otp != null){
        otpFieldShown = true;
        otpSend = otp;
        Get.snackbar('Thành công', 'Hãy kiểm tra SMS để lấy OTP', colorText: Colors.green);

      }else{
        Get.snackbar('Error', 'Lỗi hệ thống chưa sinh ra OTP', colorText: Colors.red);
      }
    }  catch (e) {
      print(e);
    }finally{
      update();
    }
  }

  Future<void> loginWithPhone() async {
    try {
      String phoneNumber = loginPhoneNumberCtrl.text;
      if (phoneNumber.isNotEmpty) {
        var querySnapshot = await userCollection
            .where('number', isEqualTo: phoneNumber)
            .limit(1)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          var userDoc = querySnapshot.docs.first;
          var userData = userDoc.data() as Map<String, dynamic>;
          box.write('loginuser', userData);
          loginPhoneNumberCtrl.clear();
          Get.to(HomePage());
          Get.snackbar('Success', 'Login Successful', colorText: Colors.green);
        } else {
          Get.snackbar('Error', 'User not found, please register', colorText: Colors.red);
        }
      }
    } catch (e) {
      print(e);
    }
  }


}