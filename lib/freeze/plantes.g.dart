// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plantes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlantImpl _$$PlantImplFromJson(Map<String, dynamic> json) => _$PlantImpl(
      idPlante: json['id_plante'] as String,
      lastName: json['name_plante'] as String,
      firstName: json['image'] as String,
      email: json['localisation'] as String,
      password: json['id_user'] as String,
    );

Map<String, dynamic> _$$PlantImplToJson(_$PlantImpl instance) =>
    <String, dynamic>{
      'id_plante': instance.idPlante,
      'name_plante': instance.lastName,
      'image': instance.firstName,
      'localisation': instance.email,
      'id_user': instance.password,
    };
