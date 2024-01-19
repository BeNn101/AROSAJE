import 'package:freezed_annotation/freezed_annotation.dart';

part 'chatHistorical.freezed.dart';
part 'chatHistorical.g.dart';

@freezed
class ChatHistorical with _$ChatHistorical {
  @JsonSerializable(explicitToJson: true)
  const factory ChatHistorical({
    @JsonKey(name: 'id_user') required int idUser,
    @JsonKey(name: 'id_destinataire') required int idAdresse,
    @JsonKey(name: 'message') required int message,
    @JsonKey(name: 'image') required int imageChat,
  }) = _ChatHistorical;

  factory ChatHistorical.fromJson(Map<String, dynamic> json) => _$ChatHistoricalFromJson(json);
}
