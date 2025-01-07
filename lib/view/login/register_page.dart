import 'package:app_client/controller/login_controller.dart';
import 'package:app_client/view/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../../widget/otp_txt_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (ctrl) {
      return Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Color(0xFF0052CC),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Thanh tiêu đề
              const Text(
                "Tạo tài khoản mới !!",
                style: TextStyle(
                  color: Color(0xFF0052CC),
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 15,),
              //Thanh Username
              TextField(
                  keyboardType: TextInputType.phone,
                  controller: ctrl.registerNameCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.phone_iphone),
                    labelText: 'Tên tài khoản',
                    hintText: 'Hãy nhập Tên tài khoản',
                  )
              ),
              SizedBox(height: 15,),
              //Thanh SĐT
              TextField(
                  keyboardType: TextInputType.phone,
                  controller: ctrl.PhoneNumberCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    prefixIcon: Icon(Icons.phonelink),
                    labelText: 'Số điện thoại',
                    hintText: 'Hãy nhập Số điện thoại',
                  )
              ),
              SizedBox(height: 20,),
              //Button Đăng ký
              OtpTxtField(
                otpController: ctrl.otpController,
                visble: ctrl.otpFieldShown,
                onComplete: (otp ) {
                  ctrl.otpEnter= int.tryParse(otp ?? '0000');
                },),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () {
                    if(ctrl.otpFieldShown){
                      ctrl.addUser();
                    }else{
                      ctrl.sendOtp();
                    }

                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF0052CC),
                  ),
                  child: Text( ctrl.otpFieldShown ? 'Đăng ký' : 'Lấp OTP'),),
              SizedBox(height: 20,),
              TextButton(
                
                  onPressed: () {
                    Get.to(LoginPage());
                  },
                  child: const Text("Đăng nhập"))
            ],
          ),
        ),
      );
    });
  }
}
