import 'dart:ui';

import 'package:app/model/product/product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomeController extends GetxController{
  String test = 'test';

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;

  TextEditingController productNameCtrl = TextEditingController();
  TextEditingController productDescriptionCtrl = TextEditingController();
  TextEditingController productImgCtrl = TextEditingController();
  TextEditingController productPriceCtrl = TextEditingController();

  String category = 'Apple';
  String brand = 'Laptop';
  bool offer = true;

  void setValuesDefault() {
    productNameCtrl.clear();
    productImgCtrl.clear();
    productDescriptionCtrl.clear();

    String category = 'Apple';
    String brand = 'Laptop';
    bool offer = true;
    update();
  }

  List<Product> products = [];

  @override
  Future<void> onInit() async {
    productCollection = firestore.collection('products');
    await fetchProduct();
    super.onInit();
  }

  //Them San Pham
  addProduct(){
    try {
      DocumentReference doc  = productCollection.doc();
      Product product = Product(
        id:doc.id,
        name: productNameCtrl.text,
        category: category,
        description: productDescriptionCtrl.text,
        price: double.tryParse(productPriceCtrl.text),
        brand: brand,
        image: productImgCtrl.text,
        offre: offer,
      );
      final producttJson = product.toJson();
      doc.set(producttJson);
      Get.snackbar('Success', 'Đã thêm sản phẩm thành công', colorText: Colors.green);
      setValuesDefault();
    } catch (e) {
      Get.snackbar('Error', e.toString(), colorText: Colors.green);
      print(e);
    }
  }

  //Lay du lieu san pham
  fetchProduct() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs.map((doc)
        => Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
      products.clear();
      products.assignAll(retrievedProducts);
      Get.snackbar("Thành công", "Đã thực hiện thành công", colorText: Colors.green);
    } catch (e) {
      Get.snackbar("Lỗi", e.toString(), colorText: Colors.green);
      print(e);
    }finally{
      update();
    }
  }

  //Xoa san pham
  deleteProduct(String id) async {
    try {
      await productCollection.doc(id).delete();
      fetchProduct();
      //Get.snackbar("Thành công", "Đã xóa dữ liệu thành công", colorText: Colors.green);
    } catch (e) {
      Get.snackbar("Lỗi", e.toString(), colorText: Colors.red);
      print(e);
    }
  }

  /*testMethod(){
    print(test);
  }*/
}