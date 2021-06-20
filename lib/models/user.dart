import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';
@JsonSerializable()
class UserData {
  @JsonKey(name: '_id')
  String? id;
  String? uid;
  String? name;

  String? phone;

  String? email;
  String? pincode;

  @JsonKey(defaultValue: false)
  bool? isAdmin;
  @JsonKey(defaultValue: 0)
  int? points;

  UserData(
      {this.uid,
      this.name,
      this.phone,
      this.email,
      this.pincode,
      this.isAdmin,
      this.points});

  factory UserData.fromJson(Map<String, dynamic> data) =>
      _$UserDataFromJson(data);
  Map<String, dynamic> toJson() => _$UserDataToJson(this);
}
