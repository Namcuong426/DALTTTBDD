import 'package:app_client/controller/login_controller.dart';
import 'package:app_client/view/login/register_page.dart';
import 'package:app_client/widget/support_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (ctrl) {
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blueGrey[50],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Thanh logo
              const Text("Welcome to SmartTech Store!",
                style: TextStyle(
                  color: Color(0xFF0052CC),
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20,),
              //Thanh nhập số điện thoại
              TextField(
                controller: ctrl.loginPhoneNumberCtrl,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  prefixIcon: Icon(Icons.phone_iphone),
                  labelText: 'Số điện thoại',
                  hintText: 'Hãy nhập Số điện thoại',
                ),
              ),
              SizedBox(height: 20,),
              //Button Đăng nhập
              ElevatedButton(
                  onPressed: () {
                    ctrl.loginWithPhone();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Color(0xFF0052CC),
                  ),
                  child: const Text("Đăng nhập")),
              SizedBox(height: 20,),
              TextButton(
                  onPressed: () {
                    Get.to(RegisterPage());
                  },
                  child: const Text("Đăng ký tài khoản mới!!!"))
            ],
          ),
        ),
      );
    });
  }
}
