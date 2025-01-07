import 'package:app/home.dart';
import 'package:app/page/Order.dart';
import 'package:app/page/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class ButtonNav extends StatefulWidget {
  const ButtonNav({super.key});

  @override
  State<ButtonNav> createState() => _ButtonNavState();
}

class _ButtonNavState extends State<ButtonNav> {

  late List<Widget> pages;

  late Home HomePage;
  late Order order;
  late Profile profile;
  int currentTabIndex = 0;

  @override
  void initState() {
    HomePage = Home();
    order = Order();
    profile = Profile();
    pages= [HomePage, order, profile];

    super.initState();
  }
  //Thanh Naviga Bar
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 65,
          backgroundColor: Colors.white,
          color: Colors.black,
          animationDuration: Duration(milliseconds: 500),
          onTap:(int index){
            setState(() {
              currentTabIndex=index;
            });
          },
          items: [
            Icon(
              Icons.home_outlined,
              color: Colors.white,),
            Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,),
            Icon(
              Icons.person_2_outlined,
              color: Colors.white,),


      ]),

      body: pages[currentTabIndex],
    );
  }
}
