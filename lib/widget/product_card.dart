import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final double price;
  final String offerTag;
  final Function onTap;
  const ProductCard(
      {super.key,
        required this.name,
        required this.imageUrl,
        required this.price,
        required this.offerTag,
        required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Hinh anh
              Image.network(
                imageUrl,
                fit: BoxFit.cover,
                width: double.maxFinite,
                height: 120,
              ),
              SizedBox(height: 9,),
              //Thanh ten
              Text(
                name,
                style: TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,),
              SizedBox(height: 9,),
              //Thanh Giá cả
              Text(
                'Giá : $price VND',
                style: const TextStyle(fontSize: 16),
                overflow: TextOverflow.ellipsis,),
              const SizedBox(height: 9,),
              //Thanh khuyen mai
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Text(
                  offerTag,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
