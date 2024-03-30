// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'plantes.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlantImpl _$$PlantImplFromJson(Map<String, dynamic> json) => _$PlantImpl(
      idPlante: json['id_plante'] as int,
      namePlante: json['name_plante'] as String,
      image: json['image'] as String,
      localisationPlante: json['localisation'] as String,
      idUser: json['id_user'] as int,
    );

Map<String, dynamic> _$$PlantImplToJson(_$PlantImpl instance) =>
    <String, dynamic>{
      'id_plante': instance.idPlante,
      'name_plante': instance.namePlante,
      'image': instance.image,
      'localisation': instance.localisationPlante,
      'id_user': instance.idUser,
    };
