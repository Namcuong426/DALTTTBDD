import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget{
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 235, 231),
      body: Container(
        margin: EdgeInsets.only(top: 50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Image.asset("images/Laptop HP.jpg"),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
                "Explore,The Best, Products",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(right: 20.0 ),
                padding: EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: Colors.black,
                  borderRadius: BorderRadius.circular(60),
                  //shape: BoxShape.circle
                ),
                child: Text(
                    "Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          )
        ],
      ),),
    );
  }
}