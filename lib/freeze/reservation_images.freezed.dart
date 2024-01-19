// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'reservation_images.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageReservation _$ImageReservationFromJson(Map<String, dynamic> json) {
  return _ImageReservation.fromJson(json);
}

/// @nodoc
mixin _$ImageReservation {
  @JsonKey(name: 'id_reservation_images')
  int get idImageReservation => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  String get image => throw _privateConstructorUsedError;
  @JsonKey(name: 'date_image')
  String get dateImage => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_reservation')
  int get idReservation => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageReservationCopyWith<ImageReservation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageReservationCopyWith<$Res> {
  factory $ImageReservationCopyWith(
          ImageReservation value, $Res Function(ImageReservation) then) =
      _$ImageReservationCopyWithImpl<$Res, ImageReservation>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_reservation_images') int idImageReservation,
      @JsonKey(name: 'image') String image,
      @JsonKey(name: 'date_image') String dateImage,
      @JsonKey(name: 'id_reservation') int idReservation});
}

/// @nodoc
class _$ImageReservationCopyWithImpl<$Res, $Val extends ImageReservation>
    implements $ImageReservationCopyWith<$Res> {
  _$ImageReservationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idImageReservation = null,
    Object? image = null,
    Object? dateImage = null,
    Object? idReservation = null,
  }) {
    return _then(_value.copyWith(
      idImageReservation: null == idImageReservation
          ? _value.idImageReservation
          : idImageReservation // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      dateImage: null == dateImage
          ? _value.dateImage
          : dateImage // ignore: cast_nullable_to_non_nullable
              as String,
      idReservation: null == idReservation
          ? _value.idReservation
          : idReservation // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageReservationImplCopyWith<$Res>
    implements $ImageReservationCopyWith<$Res> {
  factory _$$ImageReservationImplCopyWith(_$ImageReservationImpl value,
          $Res Function(_$ImageReservationImpl) then) =
      __$$ImageReservationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_reservation_images') int idImageReservation,
      @JsonKey(name: 'image') String image,
      @JsonKey(name: 'date_image') String dateImage,
      @JsonKey(name: 'id_reservation') int idReservation});
}

/// @nodoc
class __$$ImageReservationImplCopyWithImpl<$Res>
    extends _$ImageReservationCopyWithImpl<$Res, _$ImageReservationImpl>
    implements _$$ImageReservationImplCopyWith<$Res> {
  __$$ImageReservationImplCopyWithImpl(_$ImageReservationImpl _value,
      $Res Function(_$ImageReservationImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idImageReservation = null,
    Object? image = null,
    Object? dateImage = null,
    Object? idReservation = null,
  }) {
    return _then(_$ImageReservationImpl(
      idImageReservation: null == idImageReservation
          ? _value.idImageReservation
          : idImageReservation // ignore: cast_nullable_to_non_nullable
              as int,
      image: null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String,
      dateImage: null == dateImage
          ? _value.dateImage
          : dateImage // ignore: cast_nullable_to_non_nullable
              as String,
      idReservation: null == idReservation
          ? _value.idReservation
          : idReservation // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ImageReservationImpl implements _ImageReservation {
  const _$ImageReservationImpl(
      {@JsonKey(name: 'id_reservation_images') required this.idImageReservation,
      @JsonKey(name: 'image') required this.image,
      @JsonKey(name: 'date_image') required this.dateImage,
      @JsonKey(name: 'id_reservation') required this.idReservation});

  factory _$ImageReservationImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageReservationImplFromJson(json);

  @override
  @JsonKey(name: 'id_reservation_images')
  final int idImageReservation;
  @override
  @JsonKey(name: 'image')
  final String image;
  @override
  @JsonKey(name: 'date_image')
  final String dateImage;
  @override
  @JsonKey(name: 'id_reservation')
  final int idReservation;

  @override
  String toString() {
    return 'ImageReservation(idImageReservation: $idImageReservation, image: $image, dateImage: $dateImage, idReservation: $idReservation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageReservationImpl &&
            (identical(other.idImageReservation, idImageReservation) ||
                other.idImageReservation == idImageReservation) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.dateImage, dateImage) ||
                other.dateImage == dateImage) &&
            (identical(other.idReservation, idReservation) ||
                other.idReservation == idReservation));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, idImageReservation, image, dateImage, idReservation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageReservationImplCopyWith<_$ImageReservationImpl> get copyWith =>
      __$$ImageReservationImplCopyWithImpl<_$ImageReservationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageReservationImplToJson(
      this,
    );
  }
}

abstract class _ImageReservation implements ImageReservation {
  const factory _ImageReservation(
          {@JsonKey(name: 'id_reservation_images')
          required final int idImageReservation,
          @JsonKey(name: 'image') required final String image,
          @JsonKey(name: 'date_image') required final String dateImage,
          @JsonKey(name: 'id_reservation') required final int idReservation}) =
      _$ImageReservationImpl;

  factory _ImageReservation.fromJson(Map<String, dynamic> json) =
      _$ImageReservationImpl.fromJson;

  @override
  @JsonKey(name: 'id_reservation_images')
  int get idImageReservation;
  @override
  @JsonKey(name: 'image')
  String get image;
  @override
  @JsonKey(name: 'date_image')
  String get dateImage;
  @override
  @JsonKey(name: 'id_reservation')
  int get idReservation;
  @override
  @JsonKey(ignore: true)
  _$$ImageReservationImplCopyWith<_$ImageReservationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
