// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return UserData(
    uid: json['uid'] as String?,
    name: json['name'] as String?,
    phone: json['phone'] as String?,
    email: json['email'] as String?,
    pincode: json['pincode'] as String?,
    isAdmin: json['isAdmin'] as bool? ?? false,
    points: json['points'] as int? ?? 0,
  )..id = json['_id'] as String?;
}

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      '_id': instance.id,
      'uid': instance.uid,
      'name': instance.name,
      'phone': instance.phone,
      'email': instance.email,
      'pincode': instance.pincode,
      'isAdmin': instance.isAdmin,
      'points': instance.points,
    };
