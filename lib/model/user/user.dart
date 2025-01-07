import 'package:json_annotation/json_annotation.dart';
//import 'package:sky_engine/_js_annotations/_js_annotations.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  @JsonKey(name: "id")
  String? id;

  @JsonKey(name: "name")
  String? name; // Name of the product.

  @JsonKey(name: "number")
  String? number; // Description of the product (optional).



  User({
    this.id,
    this.name,
    this.number,
    });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

}