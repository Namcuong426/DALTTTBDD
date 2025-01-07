import 'package:app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:app/widget/support_widget.dart';
import 'package:get/get.dart';
import '../../widget/list_btn.dart';


class AddProductPage extends StatelessWidget {
  const AddProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(title: Text("Thêm Sản Phẩm Mới"),),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Thanh tieu de
                Text("Add Product", style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.indigoAccent,
                    fontWeight: FontWeight.bold
                ),),
                //Thanh ten San Pham
                TextField(
                  controller: ctrl.productNameCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    label: Text("Sản phẩm"),
                    hintText: "Hãy viết sản phẩm",
                  ),
                ),
                SizedBox(height: 15,),
                //Thanh mo ta San Pham
                TextField(
                  controller: ctrl.productDescriptionCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    label: Text("Mô tả"),
                    hintText: "Hãy viết mô tả",

                  ),
                  maxLines: 4,
                ),
                SizedBox(height: 15,),
                //Thanh duong dan URL Hình ảnh
                TextField(
                  controller: ctrl.productImgCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    label: Text("Hình ảnh"),
                    hintText: "Hãy chọn hình ảnh",
                  ),
                ),
                SizedBox(height: 15,),
                //Thanh giá cả
                TextField(
                  controller: ctrl.productPriceCtrl,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    label: Text("Giá"),
                    hintText: "Ghi giá",
                  ),
                ),
                //Thanh list button Danh mục sản phẩm.
                Row(
                  children: [
                    //Thanh Loại Sản Phẩm
                    Flexible(child:
                    ListBtn(
                      items: ["Apple", "SamSung", "Huawei", "Xiaomi", "Lenovo"],
                      nameOfListBtn: 'Hãng',
                      onSelected: (selectedValue) {
                        ctrl.category = selectedValue ?? 'genaral';
                        ctrl.update();
                        //print(selectedValue);
                      },)),
                    // Thanh Hãng (Brand)
                    Flexible(child:
                    ListBtn(items: [
                      "Điện thoại",
                      "Laptop",
                      "Đồng hồ",
                      "Máy tính bảng"
                    ],
                      nameOfListBtn: 'Brand',
                      onSelected: (selectedValue) {
                        //print(selectedValue);
                        ctrl.brand = selectedValue ?? 'un brand';
                        ctrl.update();
                      },)),
                  ],),
                SizedBox(height: 15,),
                Text("Sản phẩm đề xuất", style: AppWidget
                    .boldTextFeildStyle(),),
                //Thanh khuyến mãi
                ListBtn(
                  items: ["Có", "Không"],
                  nameOfListBtn: ctrl.offer.toString(),
                  onSelected: (selectedValue) {
                    ctrl.offer  = bool.tryParse(selectedValue ?? 'true') ?? true;
                    ctrl.update();
                    //print(selectedValue);
                  },),
                SizedBox(height: 15,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigoAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      ctrl.addProduct();
                    }, child: Text('Thêm Sản phẩm mới')),
                /*Container(
                  height: 130,
                  padding: EdgeInsets.all(20.0),
                  margin: EdgeInsets.only(right: 20.0),
                  decoration: BoxDecoration(
                    color: Color(0xFFFD6F3E),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  //height: 90,
                  //width: 90,
                  child: Center(child: Text("All",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold)
                    ,))),*/

              ],
            ),
          ),
        ),
      );
    });
  }
}
