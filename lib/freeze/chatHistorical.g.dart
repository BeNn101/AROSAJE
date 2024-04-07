// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatHistorical.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatHistoricalImpl _$$ChatHistoricalImplFromJson(Map<String, dynamic> json) =>
    _$ChatHistoricalImpl(
      idUser: json['id_user'] as int,
      idAdresse: json['id_destinataire'] as int,
      message: json['message'] as String,
      imageChat: json['image'] as String?,
    );

Map<String, dynamic> _$$ChatHistoricalImplToJson(
        _$ChatHistoricalImpl instance) =>
    <String, dynamic>{
      'id_user': instance.idUser,
      'id_destinataire': instance.idAdresse,
      'message': instance.message,
      'image': instance.imageChat,
    };
