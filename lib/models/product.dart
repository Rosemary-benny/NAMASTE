import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';
@JsonSerializable()
class ProductData {
  @JsonKey(name: '_id')
  String? id;
  String? uid;
  String? name;

  String? quantity;

  String? oPrice;
    String? dPrice;
  
 

  ProductData(
      {this.uid,
      this.name,
      this.quantity,
      this.oPrice,
      this.dPrice,

    });

  factory ProductData.fromJson(Map<String, dynamic> data) =>
      _$ProductDataFromJson(data);
  Map<String, dynamic> toJson() => _$ProductDataToJson(this);
}
