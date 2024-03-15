// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey(name: 'id_user')
  int get idUser => throw _privateConstructorUsedError;
  @JsonKey(name: 'nom')
  String get lastName => throw _privateConstructorUsedError;
  @JsonKey(name: 'prenom')
  String get firstName => throw _privateConstructorUsedError;
  @JsonKey(name: 'email')
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'mot_de_passe')
  String get password => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_type')
  int? get userType => throw _privateConstructorUsedError;
  @JsonKey(name: 'telephone')
  int get telephone => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar')
  String? get avatar => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id_user') int idUser,
      @JsonKey(name: 'nom') String lastName,
      @JsonKey(name: 'prenom') String firstName,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'mot_de_passe') String password,
      @JsonKey(name: 'user_type') int? userType,
      @JsonKey(name: 'telephone') int telephone,
      @JsonKey(name: 'avatar') String? avatar});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = null,
    Object? lastName = null,
    Object? firstName = null,
    Object? email = null,
    Object? password = null,
    Object? userType = freezed,
    Object? telephone = null,
    Object? avatar = freezed,
  }) {
    return _then(_value.copyWith(
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as int,
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
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as int?,
      telephone: null == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as int,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id_user') int idUser,
      @JsonKey(name: 'nom') String lastName,
      @JsonKey(name: 'prenom') String firstName,
      @JsonKey(name: 'email') String email,
      @JsonKey(name: 'mot_de_passe') String password,
      @JsonKey(name: 'user_type') int? userType,
      @JsonKey(name: 'telephone') int telephone,
      @JsonKey(name: 'avatar') String? avatar});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idUser = null,
    Object? lastName = null,
    Object? firstName = null,
    Object? email = null,
    Object? password = null,
    Object? userType = freezed,
    Object? telephone = null,
    Object? avatar = freezed,
  }) {
    return _then(_$UserImpl(
      idUser: null == idUser
          ? _value.idUser
          : idUser // ignore: cast_nullable_to_non_nullable
              as int,
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
      userType: freezed == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as int?,
      telephone: null == telephone
          ? _value.telephone
          : telephone // ignore: cast_nullable_to_non_nullable
              as int,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserImpl implements _User {
  const _$UserImpl(
      {@JsonKey(name: 'id_user') required this.idUser,
      @JsonKey(name: 'nom') required this.lastName,
      @JsonKey(name: 'prenom') required this.firstName,
      @JsonKey(name: 'email') required this.email,
      @JsonKey(name: 'mot_de_passe') required this.password,
      @JsonKey(name: 'user_type') this.userType,
      @JsonKey(name: 'telephone') required this.telephone,
      @JsonKey(name: 'avatar') this.avatar});

  factory _$UserImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserImplFromJson(json);

  @override
  @JsonKey(name: 'id_user')
  final int idUser;
  @override
  @JsonKey(name: 'nom')
  final String lastName;
  @override
  @JsonKey(name: 'prenom')
  final String firstName;
  @override
  @JsonKey(name: 'email')
  final String email;
  @override
  @JsonKey(name: 'mot_de_passe')
  final String password;
  @override
  @JsonKey(name: 'user_type')
  final int? userType;
  @override
  @JsonKey(name: 'telephone')
  final int telephone;
  @override
  @JsonKey(name: 'avatar')
  final String? avatar;

  @override
  String toString() {
    return 'User(idUser: $idUser, lastName: $lastName, firstName: $firstName, email: $email, password: $password, userType: $userType, telephone: $telephone, avatar: $avatar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.idUser, idUser) || other.idUser == idUser) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.userType, userType) ||
                other.userType == userType) &&
            (identical(other.telephone, telephone) ||
                other.telephone == telephone) &&
            (identical(other.avatar, avatar) || other.avatar == avatar));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, idUser, lastName, firstName,
      email, password, userType, telephone, avatar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserImplToJson(
      this,
    );
  }
}

abstract class _User implements User {
  const factory _User(
      {@JsonKey(name: 'id_user') required final int idUser,
      @JsonKey(name: 'nom') required final String lastName,
      @JsonKey(name: 'prenom') required final String firstName,
      @JsonKey(name: 'email') required final String email,
      @JsonKey(name: 'mot_de_passe') required final String password,
      @JsonKey(name: 'user_type') final int? userType,
      @JsonKey(name: 'telephone') required final int telephone,
      @JsonKey(name: 'avatar') final String? avatar}) = _$UserImpl;

  factory _User.fromJson(Map<String, dynamic> json) = _$UserImpl.fromJson;

  @override
  @JsonKey(name: 'id_user')
  int get idUser;
  @override
  @JsonKey(name: 'nom')
  String get lastName;
  @override
  @JsonKey(name: 'prenom')
  String get firstName;
  @override
  @JsonKey(name: 'email')
  String get email;
  @override
  @JsonKey(name: 'mot_de_passe')
  String get password;
  @override
  @JsonKey(name: 'user_type')
  int? get userType;
  @override
  @JsonKey(name: 'telephone')
  int get telephone;
  @override
  @JsonKey(name: 'avatar')
  String? get avatar;
  @override
  @JsonKey(ignore: true)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
