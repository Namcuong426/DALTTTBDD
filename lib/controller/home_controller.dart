<<<<<<< HEAD
import 'package:app_client/model/category/category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/product/product.dart';

class  HomeController extends GetxController{

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  late CollectionReference productCollection;
  late CollectionReference categoryCollection;

  List<Product> products = [];
  List<Product> productShowUi = [];
  List<Category> categories = [];
=======
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
>>>>>>> 50e286e37dce82ef82dce18832c7f8d5cfcef5dd

  @override
  Future<void> onInit() async {
    productCollection = firestore.collection('products');
<<<<<<< HEAD
    categoryCollection = firestore.collection('category');
    await fetchProduct();
    await fetchCategory();
    super.onInit();
  }

=======
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
>>>>>>> 50e286e37dce82ef82dce18832c7f8d5cfcef5dd
  fetchProduct() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs.map((doc)
<<<<<<< HEAD
      => Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
      products.clear();
      products.assignAll(retrievedProducts);
      productShowUi.assignAll(products);
      Get.snackbar("Thành công", "Đã thực hiện thành công", colorText:  Colors.green);
=======
        => Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
      products.clear();
      products.assignAll(retrievedProducts);
      Get.snackbar("Thành công", "Đã thực hiện thành công", colorText: Colors.green);
>>>>>>> 50e286e37dce82ef82dce18832c7f8d5cfcef5dd
    } catch (e) {
      Get.snackbar("Lỗi", e.toString(), colorText: Colors.green);
      print(e);
    }finally{
      update();
    }
  }

<<<<<<< HEAD
  fetchCategory() async {
    try {
      QuerySnapshot categorySnapshot = await categoryCollection.get();
      final List<Category> retrievedCategory = categorySnapshot.docs.map((doc)
      => Category.fromJson(doc.data() as Map<String, dynamic>)).toList();
      categories.clear();
      categories.assignAll(retrievedCategory);
      //Get.snackbar("Thành công", " Hãng đã lấy thành công", colorText:  Colors.green);
    } catch (e) {
      Get.snackbar("Lỗi", e.toString(), colorText: Colors.green);
      print(e);
    }finally{
      update();
    }
  }
  
  filterByCategory(String category){
    productShowUi.clear();
    productShowUi = products.where((product) => product.category == category).toList();
    update();
  }

  /*filterByBrand(String category){
    if(brands.isEmpty){
      productShowUi  = products;
    }else{
      List<String> lower
    }
    productShowUi.clear();
    productShowUi = products.where((product) => product.category == category).toList();
    update();
  }*/

  filterByBrand(List<String> brands) {
    if (brands.isEmpty) {
      productShowUi = products;
    } else {
      List<String> lowerCaseBrands = brands.map((brand) => brand.toLowerCase()).toList();
      productShowUi = products.where((product) => lowerCaseBrands.contains(product.brand?.toLowerCase())).toList();
    }
    update();
  }

  sortByPrice({required bool ascending}) {
    List<Product> sortedProducts = List<Product>.from(productShowUi);
    sortedProducts.sort((a, b) => ascending ? a.price!.compareTo(b.price!) : b.price!.compareTo(a.price!));
    productShowUi = sortedProducts;
    update();
  }


=======
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
>>>>>>> 50e286e37dce82ef82dce18832c7f8d5cfcef5dd
}