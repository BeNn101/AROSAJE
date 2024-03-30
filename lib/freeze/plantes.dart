import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'plantes.freezed.dart';
part 'plantes.g.dart';

@freezed
class Plant with _$Plant {
  @JsonSerializable(explicitToJson: true)
  const factory Plant({
    @JsonKey(name: 'id_plante') required int idPlante,
    @JsonKey(name: 'name_plante') required String namePlante,
    @JsonKey(name: 'image') required String image,
    @JsonKey(name: 'localisation') required String localisationPlante,
    @JsonKey(name: 'id_user') required int idUser,
  }) = _Plant;

  factory Plant.fromJson(Map<String, dynamic> json) => _$PlantFromJson(json);
}
