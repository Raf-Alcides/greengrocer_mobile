// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      nome: json['fullname'] as String?,
      email: json['email'] as String?,
      telefone: json['telefone'] as String?,
      password: json['password'] as String?,
      cpf: json['cpf'] as String?,
      id: json['id'] as String?,
      token: json['token'] as String?,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'fullname': instance.nome,
      'email': instance.email,
      'telefone': instance.telefone,
      'password': instance.password,
      'cpf': instance.cpf,
      'id': instance.id,
      'token': instance.token,
    };
