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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Plant _$PlantFromJson(Map<String, dynamic> json) {
  return _Plant.fromJson(json);
}

/// @nodoc
mixin _$Plant {
  @JsonKey(name: 'id_plante')
  String get idPlante => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_plante')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'localisation')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_user')
  String get password => throw _privateConstructorUsedError;

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
      {@JsonKey(name: 'id_plante') String idPlante,
      @JsonKey(name: 'name_plante') String lastName,
      @JsonKey(name: 'image') String firstName,
      @JsonKey(name: 'localisation') String email,
      @JsonKey(name: 'id_user') String password});
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
    Object? lastName = null,
    Object? firstName = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      idPlante: null == idPlante
          ? _value.idPlante
          : idPlante // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
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
      {@JsonKey(name: 'id_plante') String idPlante,
      @JsonKey(name: 'name_plante') String lastName,
      @JsonKey(name: 'image') String firstName,
      @JsonKey(name: 'localisation') String email,
      @JsonKey(name: 'id_user') String password});
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
    Object? lastName = null,
    Object? firstName = null,
    Object? email = null,
    Object? password = null,
  }) {
    return _then(_$PlantImpl(
      idPlante: null == idPlante
          ? _value.idPlante
          : idPlante // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$PlantImpl implements _Plant {
  const _$PlantImpl(
      {@JsonKey(name: 'id_plante') required this.idPlante,
      @JsonKey(name: 'name_plante') required this.lastName,
      @JsonKey(name: 'image') required this.firstName,
      @JsonKey(name: 'localisation') required this.email,
      @JsonKey(name: 'id_user') required this.password});

  factory _$PlantImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlantImplFromJson(json);

  @override
  @JsonKey(name: 'id_plante')
  final String idPlante;
  @override
  @JsonKey(name: 'name_plante')
  final String lastName;
  @override
  @JsonKey(name: 'image')
  final String firstName;
  @override
  @JsonKey(name: 'localisation')
  final String email;
  @override
  @JsonKey(name: 'id_user')
  final String password;

  @override
  String toString() {
    return 'Plant(idPlante: $idPlante, lastName: $lastName, firstName: $firstName, email: $email, password: $password)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlantImpl &&
            (identical(other.idPlante, idPlante) ||
                other.idPlante == idPlante) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idPlante, lastName, firstName, email, password);

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
      {@JsonKey(name: 'id_plante') required final String idPlante,
      @JsonKey(name: 'name_plante') required final String lastName,
      @JsonKey(name: 'image') required final String firstName,
      @JsonKey(name: 'localisation') required final String email,
      @JsonKey(name: 'id_user') required final String password}) = _$PlantImpl;

  factory _Plant.fromJson(Map<String, dynamic> json) = _$PlantImpl.fromJson;

  @override
  @JsonKey(name: 'id_plante')
  String get idPlante;
  @override
  @JsonKey(name: 'name_plante')
  String get lastName;
  @override
  @JsonKey(name: 'image')
  String get firstName;
  @override
  @JsonKey(name: 'localisation')
  String get email;
  @override
  @JsonKey(name: 'id_user')
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$PlantImplCopyWith<_$PlantImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
