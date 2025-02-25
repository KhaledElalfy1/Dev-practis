import 'package:dev_practice/features/profile/data/models/location.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  final Location location;
  @JsonKey(name: '_id')
  final String id;
  final String name;
  final String phone;
  final String email;
  final String profilePic;
  final String createdAt;

  UserModel(
      {required this.location,
      required this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.profilePic,
      required this.createdAt});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
      
}
