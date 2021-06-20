// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductData _$ProductDataFromJson(Map<String, dynamic> json) {
  return ProductData(
    uid: json['uid'] as String?,
    name: json['name'] as String?,
    quantity: json['quantity'] as String?,
    oPrice: json['oPrice'] as String?,
    dPrice: json['dPrice'] as String?,
  )..id = json['_id'] as String?;
}

Map<String, dynamic> _$ProductDataToJson(ProductData instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'quantity': instance.quantity,
      'oPrice': instance.oPrice,
      'dPrice': instance.dPrice,
    };
