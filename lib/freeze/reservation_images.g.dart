// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation_images.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageReservationImpl _$$ImageReservationImplFromJson(
        Map<String, dynamic> json) =>
    _$ImageReservationImpl(
      idImageReservation: json['id_reservation_images'] as int,
      image: json['image'] as String,
      dateImage: json['date_image'] as String,
      idReservation: json['id_reservation'] as int,
    );

Map<String, dynamic> _$$ImageReservationImplToJson(
        _$ImageReservationImpl instance) =>
    <String, dynamic>{
      'id_reservation_images': instance.idImageReservation,
      'image': instance.image,
      'date_image': instance.dateImage,
      'id_reservation': instance.idReservation,
    };
