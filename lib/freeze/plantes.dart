import 'package:freezed_annotation/freezed_annotation.dart';

part 'plantes.freezed.dart';
part 'plantes.g.dart';

@freezed
class Plant with _$Plant {
  @JsonSerializable(explicitToJson: true)
  const factory Plant({
    @JsonKey(name: 'id_plante') required String idPlante,
    @JsonKey(name: 'name_plante') required String lastName,
    @JsonKey(name: 'image') required String firstName,
    @JsonKey(name: 'localisation') required String email,
    @JsonKey(name: 'id_user') required String password,
  }) = _Plant;

  factory Plant.fromJson(Map<String, dynamic> json) => _$PlantFromJson(json);
}
