import 'package:json_annotation/json_annotation.dart';
//import 'package:sky_engine/_js_annotations/_js_annotations.dart';
part 'product.g.dart';

@JsonSerializable() // Indicates this class can be serialized.
class Product {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name; // Name of the product.

  @JsonKey(name: "description")
  String? description; // Description of the product (optional).

  @JsonKey(name: "category")
  String? category;

  @JsonKey(name: "image")
  String? image;

  @JsonKey(name: "price")
  double? price;

  @JsonKey(name: "brand")
  String? brand;

  @JsonKey(name: "offer")
  bool? offre;

  Product({
    this.id,
    this.name,
    this.description,
    this.category,
    this.image,
    this.offre,
    this.price,
    this.brand,

  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

}