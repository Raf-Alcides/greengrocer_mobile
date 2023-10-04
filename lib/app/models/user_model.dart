import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name:  'fullname')
  final String? nome;
  final String? email;
  final String? telefone;
  final String? password;
  final String? cpf;
  final String? id;
  final String? token;

  UserModel({
    this.nome,
    this.email,
    this.telefone,
    this.password,
    this.cpf,
    this.id,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
