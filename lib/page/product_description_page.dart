import 'package:app_client/controller/purchase_controller.dart';
import 'package:app_client/model/product/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDescriptionPage extends StatelessWidget {
  const ProductDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    Product product = Get.arguments['data'];
    //print(data);
    return GetBuilder<PurchaseController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Chi tiết sản phẩm',
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold
            ),),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Thanh hình anh
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.image ?? '',
                  fit: BoxFit.contain,
                  width: double.infinity,
                  height: 200,
                ),
              ),
              const SizedBox(height: 9,),
              //Thanh ten
              Text(
                product.name ?? '',
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,),
              const SizedBox(height: 9,),
              //Thanh mô tả
              Text(
                product.description ?? '',
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,),
              const SizedBox(height: 9,),
              //Thanh Giá cả
              Text(
                'Giá : ${product.price ?? ''} VND',
                style: const TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,),
              const SizedBox(height: 9,),
              //Thanh ghi chú
              TextField(
                controller: ctrl.addresController,
                maxLines: 3,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    labelText: 'Hãy nhập chi tiết cho đơn'
                ),
              ),
              const SizedBox(height: 9,),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 15),
                      backgroundColor: Colors.indigo),
                  child: Text(
                    'Buy Now',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white),),
                  onPressed: () {
                    ctrl.submitOrder(price: product.price ?? 0, item: product.name ?? '', descriton: product.description ?? '');

                  },
                ),
              )

            ],
          ),
        ),
      );
    });
  }
}
