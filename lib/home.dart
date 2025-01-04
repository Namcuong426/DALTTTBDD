import 'package:app/widget/support_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget{
  const Home ({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List categories = [
    "images/Phone.png",
    "images/Laptop.png",
    "images/Smartwatch.jpg",
    "images/Tablet.png"

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2ff2f2),
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hey, Shivam",
                      style: AppWidget.boldTextFeildStyle(),
                    ),
                    Text(
                      "Good moring", style: AppWidget.lightTextFeildStyle(),),
                  ],
                ),
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset("images/Huawei.png", height: 70,
                      width: 70,
                      fit: BoxFit.cover,))
              ],
            ),
            //Thanh tìm kiếm
            SizedBox(height: 30.0,),
            Container(
              padding: EdgeInsets.only(left: 20.0,),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10)
              ),
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Tìm kiếm sản phẩm",
                  hintStyle: AppWidget.lightTextFeildStyle(),
                  suffixIcon: Icon(Icons.search, color: Colors.black,),
                  //prefixIcon: Icon(Icons.search, color: Colors.black,),

                ),
              ),),
            //Thanh bo loc
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Category",
                    style: AppWidget.semiBoldTextFeildStyle()
                ),
                Text("Xem tất cả",
                  style: TextStyle(color: Color(0xFFfd6f3e),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),

                ),
              ],
            ),
            SizedBox(height: 20.0 ,),
            Row(
              children: [
                Container(
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
          ,))),

                Expanded(
                  child: Container(
                    //margin: EdgeInsets.only(left: 20),
                    height: 130,
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                        itemCount: categories.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryTile(image: categories[index]);
                        }),
                  ),
                ),
              ],
            ),
            //Thanh San Pham
            SizedBox(height: 20.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("All Sản phẩm", style: AppWidget.semiBoldTextFeildStyle()),
                Text("Xem tất cả",
                  style: TextStyle(color: Color(0xFFfd6f3e),
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 20.0,),
            Container(
              height: 240,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 40.0),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Image.asset("images/Laptop-HP.png", height: 120, width: 120, fit: BoxFit.cover,),
                        Text("Laptop", style: AppWidget.semiBoldTextFeildStyle(),),
                        SizedBox(height: 10.0,),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Text("22.590.000 VNĐ", style: TextStyle(
                              color: Color(0xFFfd6f3e),
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold
                            ),),
                            SizedBox(width: 50.0,),
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(color: Color(0xFFfd6f3e), borderRadius: BorderRadius.circular(6.0)),
                              child: Icon(Icons.add, color: Colors.white,))

                        ],)
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Image.asset("images/Lenovo-Legion.png", height: 120, width: 120, fit: BoxFit.cover,),
                        Text("Laptop Lenovo LOQ ", style: AppWidget.semiBoldTextFeildStyle(),),
                        SizedBox(height: 10.0,),
                        Row(
                          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            Text("24.990.000 VNĐ", style: TextStyle(
                                color: Color(0xFFfd6f3e),
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold
                            ),),
                            SizedBox(width: 50.0,),
                            Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(color: Color(0xFFfd6f3e), borderRadius: BorderRadius.circular(6.0)),
                                child: Icon(Icons.add, color: Colors.white,))

                          ],)
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
class CategoryTile extends StatelessWidget{
  //const CategoryTile({super.key});
  String image;
  CategoryTile({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      margin: EdgeInsets.only(right: 20.0),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10),
      ),
      //height: 90,
      //width: 90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(image,
            height: 50,
            width: 50,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10.0,),
          Icon(Icons.arrow_forward)
        ],
      ),
    );
  }
}