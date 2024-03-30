// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'plantes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Plant _$PlantFromJson(Map<String, dynamic> json) {
  return _Plant.fromJson(json);
}

/// @nodoc
mixin _$Plant {
  @JsonKey(name: 'id_plante')
  int get idPlante => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_plante')
  String get namePlante => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'localisation')
  String get localisationPlante => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_user')
  int get idUser => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlantCopyWith<Plant> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlantCopyWith<$Res> {
  factory $PlantCopyWith(Plant value, $Res Function(Plant) then) =
      _$PlantCopyWithImpl<$Res, Plant>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_plante') int idPlante,
      @JsonKey(name: 'name_plante') String namePlante,
      @JsonKey(name: 'image') String image,
      @JsonKey(name: 'localisation') String localisationPlante,
      @JsonKey(name: 'id_user') int idUser});
}

/// @nodoc
class _$PlantCopyWithImpl<$Res, $Val extends Plant>
    implements $PlantCopyWith<$Res> {
  _$PlantCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idPlante = null,
    Object? namePlante = null,
    Object? image = null,
    Object? localisationPlante = null,
    Object? idUser = null,
  }) {
    return _then(_value.copyWith(
      idPlante: null == idPlante
          ? _value.idPlante
          : idPlante // ignore: cast_nullable_to_non_nullable
              as int,
      namePlante: null == namePlante
          ? _value.namePlante
          : namePlante // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      localisationPlante: null == localisationPlante
          ? _value.localisationPlante
          : localisationPlante // ignore: cast_nullable_to_non_nullable
              as String,
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlantImplCopyWith<$Res> implements $PlantCopyWith<$Res> {
  factory _$$PlantImplCopyWith(
          _$PlantImpl value, $Res Function(_$PlantImpl) then) =
      __$$PlantImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_plante') int idPlante,
      @JsonKey(name: 'name_plante') String namePlante,
      @JsonKey(name: 'image') String image,
      @JsonKey(name: 'localisation') String localisationPlante,
      @JsonKey(name: 'id_user') int idUser});
}

/// @nodoc
class __$$PlantImplCopyWithImpl<$Res>
    extends _$PlantCopyWithImpl<$Res, _$PlantImpl>
    implements _$$PlantImplCopyWith<$Res> {
  __$$PlantImplCopyWithImpl(
      _$PlantImpl _value, $Res Function(_$PlantImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idPlante = null,
    Object? namePlante = null,
    Object? image = null,
    Object? localisationPlante = null,
    Object? idUser = null,
  }) {
    return _then(_$PlantImpl(
      idPlante: null == idPlante
          ? _value.idPlante
          : idPlante // ignore: cast_nullable_to_non_nullable
              as int,
      namePlante: null == namePlante
          ? _value.namePlante
          : namePlante // ignore: cast_nullable_to_non_nullable
              as String,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      localisationPlante: null == localisationPlante
          ? _value.localisationPlante
          : localisationPlante // ignore: cast_nullable_to_non_nullable
              as String,
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PlantImpl implements _Plant {
  const _$PlantImpl(
      {@JsonKey(name: 'id_plante') required this.idPlante,
      @JsonKey(name: 'name_plante') required this.namePlante,
      @JsonKey(name: 'image') required this.image,
      @JsonKey(name: 'localisation') required this.localisationPlante,
      @JsonKey(name: 'id_user') required this.idUser});

  factory _$PlantImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlantImplFromJson(json);

  @override
  @JsonKey(name: 'id_plante')
  final int idPlante;
  @override
  @JsonKey(name: 'name_plante')
  final String namePlante;
  @override
  @JsonKey(name: 'image')
  final String image;
  @override
  @JsonKey(name: 'localisation')
  final String localisationPlante;
  @override
  @JsonKey(name: 'id_user')
  final int idUser;

  @override
  String toString() {
    return 'Plant(idPlante: $idPlante, namePlante: $namePlante, image: $image, localisationPlante: $localisationPlante, idUser: $idUser)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlantImpl &&
            (identical(other.idPlante, idPlante) ||
                other.idPlante == idPlante) &&
            (identical(other.namePlante, namePlante) ||
                other.namePlante == namePlante) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.localisationPlante, localisationPlante) ||
                other.localisationPlante == localisationPlante) &&
            (identical(other.idUser, idUser) || other.idUser == idUser));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, idPlante, namePlante, image, localisationPlante, idUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlantImplCopyWith<_$PlantImpl> get copyWith =>
      __$$PlantImplCopyWithImpl<_$PlantImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlantImplToJson(
      this,
    );
  }
}

abstract class _Plant implements Plant {
  const factory _Plant(
      {@JsonKey(name: 'id_plante') required final int idPlante,
      @JsonKey(name: 'name_plante') required final String namePlante,
      @JsonKey(name: 'image') required final String image,
      @JsonKey(name: 'localisation') required final String localisationPlante,
      @JsonKey(name: 'id_user') required final int idUser}) = _$PlantImpl;

  factory _Plant.fromJson(Map<String, dynamic> json) = _$PlantImpl.fromJson;

  @override
  @JsonKey(name: 'id_plante')
  int get idPlante;
  @override
  @JsonKey(name: 'name_plante')
  String get namePlante;
  @override
  @JsonKey(name: 'image')
  String get image;
  @override
  @JsonKey(name: 'localisation')
  String get localisationPlante;
  @override
  @JsonKey(name: 'id_user')
  int get idUser;
  @override
  @JsonKey(ignore: true)
  _$$PlantImplCopyWith<_$PlantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
