// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatImpl _$$ChatImplFromJson(Map<String, dynamic> json) => _$ChatImpl(
      id: json['id'] as int,
      id_user: json['id_user'] as int,
      id_recipient: json['id_recipient'] as int,
      title: json['title'] as String,
      name_recipient: json['name_recipient'] as String,
    );

Map<String, dynamic> _$$ChatImplToJson(_$ChatImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'id_user': instance.id_user,
      'id_recipient': instance.id_recipient,
      'title': instance.title,
      'name_recipient': instance.name_recipient,
    };
