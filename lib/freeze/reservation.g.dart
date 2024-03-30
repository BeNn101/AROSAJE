// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReservationImpl _$$ReservationImplFromJson(Map<String, dynamic> json) =>
    _$ReservationImpl(
      idReservation: json['id_reservation'] as int,
      idPlant: json['id_plante'] as int,
      idUser: json['id_user'] as int,
      idGuardian: json['id_guardian'] as int,
    );

Map<String, dynamic> _$$ReservationImplToJson(_$ReservationImpl instance) =>
    <String, dynamic>{
      'id_reservation': instance.idReservation,
      'id_plante': instance.idPlant,
      'id_user': instance.idUser,
      'id_guardian': instance.idGuardian,
    };
