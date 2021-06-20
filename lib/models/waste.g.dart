// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'waste.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WasteData _$WasteDataFromJson(Map<String, dynamic> json) {
  return WasteData(
    uid: json['uid'] as String?,
    name: json['name'] as String?,
    phone: json['phone'] as String?,
    type: json['type'] as String?,
    weight: json['weight'] as String?,
    pincode: json['pincode'] as String?,
    ward: json['ward'] as String?,
    isCollected: json['isCollected'] as bool? ?? false,
  )..id = json['_id'] as String?;
}

Map<String, dynamic> _$WasteDataToJson(WasteData instance) => <String, dynamic>{
      '_id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'type': instance.type,
      'weight': instance.weight,
      'phone': instance.phone,
      'ward': instance.ward,
      'pincode': instance.pincode,
      'isCollected': instance.isCollected,
    };
