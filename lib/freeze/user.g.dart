// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserImpl _$$UserImplFromJson(Map<String, dynamic> json) => _$UserImpl(
      idUser: json['id_user'] as int,
      lastName: json['nom'] as String,
      firstName: json['prenom'] as String,
      email: json['email'] as String,
      password: json['mot_de_passe'] as String,
      userType: json['user_type'] as int,
      telephone: json['telephone'] as int,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$$UserImplToJson(_$UserImpl instance) =>
    <String, dynamic>{
      'id_user': instance.idUser,
      'nom': instance.lastName,
      'prenom': instance.firstName,
      'email': instance.email,
      'mot_de_passe': instance.password,
      'user_type': instance.userType,
      'telephone': instance.telephone,
      'avatar': instance.avatar,
    };
