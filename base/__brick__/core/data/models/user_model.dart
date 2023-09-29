import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class UserModel {
  final int id;
  final String? email;
  final int? typeRegister;
  final int? role;
  final String? username;
  final dynamic name;
  final int? gender;
  final String? birth;
  final dynamic status;
  final int? accountType;
  final dynamic key;
  final dynamic language;
  final String? country;
  final String? province;
  final dynamic emailVerifiedAt;
  final dynamic createdAt;
  final dynamic updatedAt;

  UserModel({
    int? id,
    this.email,
    this.typeRegister,
    this.role,
    this.username,
    this.name,
    this.gender,
    this.birth,
    this.status,
    this.accountType,
    this.key,
    this.language,
    this.country,
    this.province,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
  }) : id = id??1;


  factory UserModel.fromJson(Map<String, dynamic> json) {
    return  _$UserModelFromJson(json);
  }


  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
