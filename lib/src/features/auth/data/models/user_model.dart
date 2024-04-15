import 'package:json_annotation/json_annotation.dart';


import '../../domain/entity/user.dart';

part 'user_model.g.dart';
@JsonSerializable()
class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.about,
    required super.name,
    required super.email,
    required super.mobileNo,
    required super.profilePicUrl
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}