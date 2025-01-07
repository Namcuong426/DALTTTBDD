import 'package:flutter/material.dart';

class AppWidget{

  //Goi In dam Bold
  static TextStyle boldTextFeildStyle(){
    return TextStyle(
        color: Colors.black,
        fontSize: 28.0,
        fontWeight: FontWeight.bold);
  }

  //In chu may xam
  static TextStyle lightTextFeildStyle() {
    return TextStyle(
        color: Colors.black54,
        fontSize: 20.0,
        fontWeight: FontWeight.w500);
  }

  //Im chu may xam
  static TextStyle semiBoldTextFeildStyle() {
    return TextStyle(
        color: Colors.black,
        fontSize: 20.0,
        fontWeight: FontWeight.bold);
  }

  static TextStyle logoTextFeildStyle(){
    return TextStyle(
        color: Color(0xFF0052CC),
        fontSize: 28.0,
        fontWeight: FontWeight.bold);
  }
  static TextStyle titleTextFeildStyle(){
    return TextStyle(
        color: Color(0xFF4285F4),
        fontSize: 28.0,
        fontWeight: FontWeight.bold);
  }
}