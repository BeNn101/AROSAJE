import 'package:freezed_annotation/freezed_annotation.dart';


part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @JsonKey(name: 'id_user') required int idUser,
    @JsonKey(name: 'nom') required String lastName,
    @JsonKey(name: 'prenom') required String firstName,
    @JsonKey(name: 'email') required String email,
    @JsonKey(name: 'mot_de_passe') required String password,
    @JsonKey(name: 'user_type')  int? userType,
    @JsonKey(name: 'telephone') required int telephone,
    @JsonKey(name: 'avatar')  String? avatar,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
