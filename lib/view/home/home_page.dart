import 'package:app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../product/add_product_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return Scaffold(
        appBar: AppBar(title: Text("Footware Admin"),),
        body: ListView.builder(
            itemCount: ctrl.products.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(ctrl.products[index].name ?? ''),
                  subtitle: Text((ctrl.products[index].price ?? 0).toString()),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      //ctrl.testMethod();
                      ctrl.deleteProduct(ctrl.products[index].id ?? '');
                      // print('delete');
                    },

                  ));
            }

        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          //print("Them moi du lieu");
          Get.to(AddProductPage());
        }, child: Icon(Icons.add),),
      );
    });
  }
}

/*appBar: AppBar(title:  Text("Footware Admin"),),
body: ListView.builder(
itemCount: 10,
itemBuilder: (context, index){
return ListTile(title: Text("title"),
subtitle: Text("Price : 100"),
trailing: IconButton(onPressed: (){},
icon: Icon(Icons.delete),
));
}

),
floatingActionButton: FloatingActionButton(onPressed: (){
//print("Them moi du lieu");
Get.to(AddProductPage());
}, child: Icon(Icons.add),),*/
