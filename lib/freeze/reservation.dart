import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation.freezed.dart';
part 'reservation.g.dart';

@freezed
class Reservation with _$Reservation {
  @JsonSerializable(explicitToJson: true)
  const factory Reservation({
    @JsonKey(name: 'id_reservation') required int idReservation,
    @JsonKey(name: 'id_plante') required int idPlant,
    @JsonKey(name: 'id_user') required int idUser,
    @JsonKey(name: 'id_guardian') required int idGuardian,
  }) = _Reservation;

  factory Reservation.fromJson(Map<String, dynamic> json) => _$ReservationFromJson(json);
}
