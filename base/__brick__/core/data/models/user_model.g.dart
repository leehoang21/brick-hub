// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      id: json['id'] as int?,
      email: json['email'] as String?,
      typeRegister: json['type_register'] as int?,
      role: json['role'] as int?,
      username: json['username'] as String?,
      name: json['name'],
      gender: json['gender'] as int?,
      birth: json['birth'] as String?,
      status: json['status'],
      accountType: json['account_type'] as int?,
      key: json['key'],
      language: json['language'],
      country: json['country'] as String?,
      province: json['province'] as String?,
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'type_register': instance.typeRegister,
      'role': instance.role,
      'username': instance.username,
      'name': instance.name,
      'gender': instance.gender,
      'birth': instance.birth,
      'status': instance.status,
      'account_type': instance.accountType,
      'key': instance.key,
      'language': instance.language,
      'country': instance.country,
      'province': instance.province,
      'email_verified_at': instance.emailVerifiedAt,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
    };
