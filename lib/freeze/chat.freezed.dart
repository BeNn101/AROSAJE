// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Chat _$ChatFromJson(Map<String, dynamic> json) {
  return _Chat.fromJson(json);
}

/// @nodoc
mixin _$Chat {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_user')
  int get id_user => throw _privateConstructorUsedError;
  @JsonKey(name: 'id_recipient')
  int get id_recipient => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'name_recipient')
  String get name_recipient => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatCopyWith<Chat> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatCopyWith<$Res> {
  factory $ChatCopyWith(Chat value, $Res Function(Chat) then) =
      _$ChatCopyWithImpl<$Res, Chat>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'id_user') int id_user,
      @JsonKey(name: 'id_recipient') int id_recipient,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'name_recipient') String name_recipient});
}

/// @nodoc
class _$ChatCopyWithImpl<$Res, $Val extends Chat>
    implements $ChatCopyWith<$Res> {
  _$ChatCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? id_user = null,
    Object? id_recipient = null,
    Object? title = null,
    Object? name_recipient = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      id_user: null == id_user
          ? _value.id_user
          : id_user // ignore: cast_nullable_to_non_nullable
              as int,
      id_recipient: null == id_recipient
          ? _value.id_recipient
          : id_recipient // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      name_recipient: null == name_recipient
          ? _value.name_recipient
          : name_recipient // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatImplCopyWith<$Res> implements $ChatCopyWith<$Res> {
  factory _$$ChatImplCopyWith(
          _$ChatImpl value, $Res Function(_$ChatImpl) then) =
      __$$ChatImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'id_user') int id_user,
      @JsonKey(name: 'id_recipient') int id_recipient,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'name_recipient') String name_recipient});
}

/// @nodoc
class __$$ChatImplCopyWithImpl<$Res>
    extends _$ChatCopyWithImpl<$Res, _$ChatImpl>
    implements _$$ChatImplCopyWith<$Res> {
  __$$ChatImplCopyWithImpl(_$ChatImpl _value, $Res Function(_$ChatImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? id_user = null,
    Object? id_recipient = null,
    Object? title = null,
    Object? name_recipient = null,
  }) {
    return _then(_$ChatImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      id_user: null == id_user
          ? _value.id_user
          : id_user // ignore: cast_nullable_to_non_nullable
              as int,
      id_recipient: null == id_recipient
          ? _value.id_recipient
          : id_recipient // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      name_recipient: null == name_recipient
          ? _value.name_recipient
          : name_recipient // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$ChatImpl implements _Chat {
  const _$ChatImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'id_user') required this.id_user,
      @JsonKey(name: 'id_recipient') required this.id_recipient,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'name_recipient') required this.name_recipient});

  factory _$ChatImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'id_user')
  final int id_user;
  @override
  @JsonKey(name: 'id_recipient')
  final int id_recipient;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'name_recipient')
  final String name_recipient;

  @override
  String toString() {
    return 'Chat(id: $id, id_user: $id_user, id_recipient: $id_recipient, title: $title, name_recipient: $name_recipient)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.id_user, id_user) || other.id_user == id_user) &&
            (identical(other.id_recipient, id_recipient) ||
                other.id_recipient == id_recipient) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.name_recipient, name_recipient) ||
                other.name_recipient == name_recipient));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, id_user, id_recipient, title, name_recipient);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatImplCopyWith<_$ChatImpl> get copyWith =>
      __$$ChatImplCopyWithImpl<_$ChatImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatImplToJson(
      this,
    );
  }
}

abstract class _Chat implements Chat {
  const factory _Chat(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'id_user') required final int id_user,
      @JsonKey(name: 'id_recipient') required final int id_recipient,
      @JsonKey(name: 'title') required final String title,
      @JsonKey(name: 'name_recipient')
      required final String name_recipient}) = _$ChatImpl;

  factory _Chat.fromJson(Map<String, dynamic> json) = _$ChatImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'id_user')
  int get id_user;
  @override
  @JsonKey(name: 'id_recipient')
  int get id_recipient;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'name_recipient')
  String get name_recipient;
  @override
  @JsonKey(ignore: true)
  _$$ChatImplCopyWith<_$ChatImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
