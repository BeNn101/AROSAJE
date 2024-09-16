import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat.freezed.dart';
part 'chat.g.dart';

@freezed
class Chat with _$Chat {
  @JsonSerializable(explicitToJson: true)
  const factory Chat({
    @JsonKey(name: 'id') required int id,
    @JsonKey(name: 'id_user') required int id_user,
    @JsonKey(name: 'id_recipient') required int id_recipient,
    @JsonKey(name: 'title') required String title,
    @JsonKey(name: 'name_recipient') required String name_recipient,
  }) = _Chat;

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);
}
