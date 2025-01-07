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

  @override
  Future<void> onInit() async {
    productCollection = firestore.collection('products');
    categoryCollection = firestore.collection('category');
    await fetchProduct();
    await fetchCategory();
    super.onInit();
  }

  fetchProduct() async {
    try {
      QuerySnapshot productSnapshot = await productCollection.get();
      final List<Product> retrievedProducts = productSnapshot.docs.map((doc)
      => Product.fromJson(doc.data() as Map<String, dynamic>)).toList();
      products.clear();
      products.assignAll(retrievedProducts);
      productShowUi.assignAll(products);
      Get.snackbar("Thành công", "Đã thực hiện thành công", colorText:  Colors.green);
    } catch (e) {
      Get.snackbar("Lỗi", e.toString(), colorText: Colors.green);
      print(e);
    }finally{
      update();
    }
  }

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


}