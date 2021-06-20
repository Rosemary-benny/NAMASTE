import 'package:json_annotation/json_annotation.dart';
part 'waste.g.dart';
@JsonSerializable()
class WasteData {
  @JsonKey(name: '_id')
  String? id;
  String? uid;
  String? name;

  String? type;

  String? weight;
    String? phone;
      String? ward;
  String? pincode;

  @JsonKey(defaultValue: false)
  bool? isCollected;
 

  WasteData(
      {this.uid,
      this.name,
      this.phone,
      this.type,
      this.weight,
      this.pincode,
      this.ward,
      this.isCollected,
    });

  factory WasteData.fromJson(Map<String, dynamic> data) =>
      _$WasteDataFromJson(data);
  Map<String, dynamic> toJson() => _$WasteDataToJson(this);
}
