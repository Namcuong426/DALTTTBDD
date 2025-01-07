import 'package:app_client/controller/home_controller.dart';
import 'package:app_client/page/product_description_page.dart';
import 'package:app_client/view/login/login_page.dart';
import 'package:app_client/widget/list_btn.dart';
import 'package:app_client/widget/multi_select_list_btn.dart';
import 'package:app_client/widget/product_card.dart';
import 'package:app_client/widget/support_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (ctrl) {
      return RefreshIndicator(
        onRefresh: () async{
          ctrl.fetchProduct();
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'SmartTech Store', style: AppWidget.titleTextFeildStyle(),),
            actions: [
              //nút đăng xuất
              IconButton(onPressed: () {
                GetStorage box = GetStorage();
                box.erase();
                Get.offAll(LoginPage());
              },
                  icon: Icon(
                    Icons.logout_outlined,
                    color: Color(0xFF424242),))
            ],
          ),
          body: Column(
            children: [
              SizedBox(
                height: 50,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: ctrl.categories.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: (){
                          //print('test category');

                          ctrl.filterByCategory(ctrl.categories[index].name ?? '');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Chip(label: Text(ctrl.categories[index].name ?? 'Eror'),),
                        ),
                      );
                    }),
              ),
              Row(
                children: [
                  Flexible(
                    child: ListBtn(
                      items: ['Thấp đến cao',' Cao đến thấp' ],
                      nameOfListBtn: 'Sắp xếp',
                      onSelected: (selectedValue) {
                        ctrl.sortByPrice( ascending: selectedValue == 'Thấp đến cao' ? true : false );
                        //ctrl.category = selectedValue ?? 'genaral';
                        //ctrl.update();
                        //print(selectedValue);
                      },),
                  ),
                  Flexible(child: MultiSelectListBtn(items: [
                    "Apple",
                    "SamSung",
                    "Huawei",
                    "Xiaomi",
                    "Lenovo"],
                    onSelectionChanged:(selectedItems) {
                      ctrl.filterByBrand(selectedItems);
                    }
                    ,)),
                ],
              ),
              Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,),
                    itemCount: ctrl.products.length ,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        name: ctrl.productShowUi[index].name ?? 'No name',
                        imageUrl: ctrl.productShowUi[index].image ?? 'url',
                        price: ctrl.productShowUi[index].price ?? 00,
                        offerTag: '30% off',
                        onTap: () {
                          /*Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDescriptionPage())
                          );*/
                          Get.to(ProductDescriptionPage(), arguments: {'data ' :ctrl.productShowUi[index]});
                        },);
                    }),
              )
            ],
          ),
        ),
      );
    });
  }
}
