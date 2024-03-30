import 'package:freezed_annotation/freezed_annotation.dart';

part 'reservation_images.freezed.dart';
part 'reservation_images.g.dart';

@freezed
class ImageReservation with _$ImageReservation {
  @JsonSerializable(explicitToJson: true)
  const factory ImageReservation({
    @JsonKey(name: 'id_reservation_images') required int idImageReservation,
    @JsonKey(name: 'image') required String image,
    @JsonKey(name: 'date_image') required String dateImage,
    @JsonKey(name: 'id_reservation') required int idReservation,
  }) = _ImageReservation;

  factory ImageReservation.fromJson(Map<String, dynamic> json) => _$ImageReservationFromJson(json);
}
