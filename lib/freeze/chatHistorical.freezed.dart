// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chatHistorical.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatHistorical _$ChatHistoricalFromJson(Map<String, dynamic> json) {
  return _ChatHistorical.fromJson(json);
}

/// @nodoc
mixin _$ChatHistorical {
  @JsonKey(name: 'id_user')
  int get idUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_destinataire')
  int get idAdresse => throw _privateConstructorUsedError;
  @JsonKey(name: 'message')
  int get message => throw _privateConstructorUsedError;
  @JsonKey(name: 'image')
  int get imageChat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatHistoricalCopyWith<ChatHistorical> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatHistoricalCopyWith<$Res> {
  factory $ChatHistoricalCopyWith(
          ChatHistorical value, $Res Function(ChatHistorical) then) =
      _$ChatHistoricalCopyWithImpl<$Res, ChatHistorical>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_user') int idUser,
      @JsonKey(name: 'id_destinataire') int idAdresse,
      @JsonKey(name: 'message') int message,
      @JsonKey(name: 'image') int imageChat});
}

/// @nodoc
class _$ChatHistoricalCopyWithImpl<$Res, $Val extends ChatHistorical>
    implements $ChatHistoricalCopyWith<$Res> {
  _$ChatHistoricalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = null,
    Object? idAdresse = null,
    Object? message = null,
    Object? imageChat = null,
  }) {
    return _then(_value.copyWith(
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as int,
      idAdresse: null == idAdresse
          ? _value.idAdresse
          : idAdresse // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as int,
      imageChat: null == imageChat
          ? _value.imageChat
          : imageChat // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatHistoricalImplCopyWith<$Res>
    implements $ChatHistoricalCopyWith<$Res> {
  factory _$$ChatHistoricalImplCopyWith(_$ChatHistoricalImpl value,
          $Res Function(_$ChatHistoricalImpl) then) =
      __$$ChatHistoricalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_user') int idUser,
      @JsonKey(name: 'id_destinataire') int idAdresse,
      @JsonKey(name: 'message') int message,
      @JsonKey(name: 'image') int imageChat});
}

/// @nodoc
class __$$ChatHistoricalImplCopyWithImpl<$Res>
    extends _$ChatHistoricalCopyWithImpl<$Res, _$ChatHistoricalImpl>
    implements _$$ChatHistoricalImplCopyWith<$Res> {
  __$$ChatHistoricalImplCopyWithImpl(
      _$ChatHistoricalImpl _value, $Res Function(_$ChatHistoricalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = null,
    Object? idAdresse = null,
    Object? message = null,
    Object? imageChat = null,
  }) {
    return _then(_$ChatHistoricalImpl(
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as int,
      idAdresse: null == idAdresse
          ? _value.idAdresse
          : idAdresse // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as int,
      imageChat: null == imageChat
          ? _value.imageChat
          : imageChat // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ChatHistoricalImpl implements _ChatHistorical {
  const _$ChatHistoricalImpl(
      {@JsonKey(name: 'id_user') required this.idUser,
      @JsonKey(name: 'id_destinataire') required this.idAdresse,
      @JsonKey(name: 'message') required this.message,
      @JsonKey(name: 'image') required this.imageChat});

  factory _$ChatHistoricalImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatHistoricalImplFromJson(json);

  @override
  @JsonKey(name: 'id_user')
  final int idUser;
  @override
  @JsonKey(name: 'id_destinataire')
  final int idAdresse;
  @override
  @JsonKey(name: 'message')
  final int message;
  @override
  @JsonKey(name: 'image')
  final int imageChat;

  @override
  String toString() {
    return 'ChatHistorical(idUser: $idUser, idAdresse: $idAdresse, message: $message, imageChat: $imageChat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatHistoricalImpl &&
            (identical(other.idUser, idUser) || other.idUser == idUser) &&
            (identical(other.idAdresse, idAdresse) ||
                other.idAdresse == idAdresse) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.imageChat, imageChat) ||
                other.imageChat == imageChat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, idUser, idAdresse, message, imageChat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatHistoricalImplCopyWith<_$ChatHistoricalImpl> get copyWith =>
      __$$ChatHistoricalImplCopyWithImpl<_$ChatHistoricalImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatHistoricalImplToJson(
      this,
    );
  }
}

abstract class _ChatHistorical implements ChatHistorical {
  const factory _ChatHistorical(
          {@JsonKey(name: 'id_user') required final int idUser,
          @JsonKey(name: 'id_destinataire') required final int idAdresse,
          @JsonKey(name: 'message') required final int message,
          @JsonKey(name: 'image') required final int imageChat}) =
      _$ChatHistoricalImpl;

  factory _ChatHistorical.fromJson(Map<String, dynamic> json) =
      _$ChatHistoricalImpl.fromJson;

  @override
  @JsonKey(name: 'id_user')
  int get idUser;
  @override
  @JsonKey(name: 'id_destinataire')
  int get idAdresse;
  @override
  @JsonKey(name: 'message')
  int get message;
  @override
  @JsonKey(name: 'image')
  int get imageChat;
  @override
  @JsonKey(ignore: true)
  _$$ChatHistoricalImplCopyWith<_$ChatHistoricalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
