// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Reservation _$ReservationFromJson(Map<String, dynamic> json) {
  return _Reservation.fromJson(json);
}

/// @nodoc
mixin _$Reservation {
  @JsonKey(name: 'id_reservation')
  int get idReservation => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_plante')
  int get idPlant => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_user')
  int get idUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_guardian')
  int get idGuardian => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReservationCopyWith<Reservation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReservationCopyWith<$Res> {
  factory $ReservationCopyWith(
          Reservation value, $Res Function(Reservation) then) =
      _$ReservationCopyWithImpl<$Res, Reservation>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_reservation') int idReservation,
      @JsonKey(name: 'id_plante') int idPlant,
      @JsonKey(name: 'id_user') int idUser,
      @JsonKey(name: 'id_guardian') int idGuardian});
}

/// @nodoc
class _$ReservationCopyWithImpl<$Res, $Val extends Reservation>
    implements $ReservationCopyWith<$Res> {
  _$ReservationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idReservation = null,
    Object? idPlant = null,
    Object? idUser = null,
    Object? idGuardian = null,
  }) {
    return _then(_value.copyWith(
      idReservation: null == idReservation
          ? _value.idReservation
          : idReservation // ignore: cast_nullable_to_non_nullable
              as int,
      idPlant: null == idPlant
          ? _value.idPlant
          : idPlant // ignore: cast_nullable_to_non_nullable
              as int,
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as int,
      idGuardian: null == idGuardian
          ? _value.idGuardian
          : idGuardian // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReservationImplCopyWith<$Res>
    implements $ReservationCopyWith<$Res> {
  factory _$$ReservationImplCopyWith(
          _$ReservationImpl value, $Res Function(_$ReservationImpl) then) =
      __$$ReservationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_reservation') int idReservation,
      @JsonKey(name: 'id_plante') int idPlant,
      @JsonKey(name: 'id_user') int idUser,
      @JsonKey(name: 'id_guardian') int idGuardian});
}

/// @nodoc
class __$$ReservationImplCopyWithImpl<$Res>
    extends _$ReservationCopyWithImpl<$Res, _$ReservationImpl>
    implements _$$ReservationImplCopyWith<$Res> {
  __$$ReservationImplCopyWithImpl(
      _$ReservationImpl _value, $Res Function(_$ReservationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idReservation = null,
    Object? idPlant = null,
    Object? idUser = null,
    Object? idGuardian = null,
  }) {
    return _then(_$ReservationImpl(
      idReservation: null == idReservation
          ? _value.idReservation
          : idReservation // ignore: cast_nullable_to_non_nullable
              as int,
      idPlant: null == idPlant
          ? _value.idPlant
          : idPlant // ignore: cast_nullable_to_non_nullable
              as int,
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as int,
      idGuardian: null == idGuardian
          ? _value.idGuardian
          : idGuardian // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ReservationImpl implements _Reservation {
  const _$ReservationImpl(
      {@JsonKey(name: 'id_reservation') required this.idReservation,
      @JsonKey(name: 'id_plante') required this.idPlant,
      @JsonKey(name: 'id_user') required this.idUser,
      @JsonKey(name: 'id_guardian') required this.idGuardian});

  factory _$ReservationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReservationImplFromJson(json);

  @override
  @JsonKey(name: 'id_reservation')
  final int idReservation;
  @override
  @JsonKey(name: 'id_plante')
  final int idPlant;
  @override
  @JsonKey(name: 'id_user')
  final int idUser;
  @override
  @JsonKey(name: 'id_guardian')
  final int idGuardian;

  @override
  String toString() {
    return 'Reservation(idReservation: $idReservation, idPlant: $idPlant, idUser: $idUser, idGuardian: $idGuardian)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReservationImpl &&
            (identical(other.idReservation, idReservation) ||
                other.idReservation == idReservation) &&
            (identical(other.idPlant, idPlant) || other.idPlant == idPlant) &&
            (identical(other.idUser, idUser) || other.idUser == idUser) &&
            (identical(other.idGuardian, idGuardian) ||
                other.idGuardian == idGuardian));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idReservation, idPlant, idUser, idGuardian);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReservationImplCopyWith<_$ReservationImpl> get copyWith =>
      __$$ReservationImplCopyWithImpl<_$ReservationImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReservationImplToJson(
      this,
    );
  }
}

abstract class _Reservation implements Reservation {
  const factory _Reservation(
          {@JsonKey(name: 'id_reservation') required final int idReservation,
          @JsonKey(name: 'id_plante') required final int idPlant,
          @JsonKey(name: 'id_user') required final int idUser,
          @JsonKey(name: 'id_guardian') required final int idGuardian}) =
      _$ReservationImpl;

  factory _Reservation.fromJson(Map<String, dynamic> json) =
      _$ReservationImpl.fromJson;

  @override
  @JsonKey(name: 'id_reservation')
  int get idReservation;
  @override
  @JsonKey(name: 'id_plante')
  int get idPlant;
  @override
  @JsonKey(name: 'id_user')
  int get idUser;
  @override
  @JsonKey(name: 'id_guardian')
  int get idGuardian;
  @override
  @JsonKey(ignore: true)
  _$$ReservationImplCopyWith<_$ReservationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
