import 'package:json_annotation/json_annotation.dart';
//import 'package:sky_engine/_js_annotations/_js_annotations.dart';
part 'category.g.dart';

@JsonSerializable()
class Category {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name; // Name of the product.


  Category({
    this.id,
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryToJson(this);

}