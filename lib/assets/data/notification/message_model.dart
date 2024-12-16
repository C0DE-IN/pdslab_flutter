import 'package:freezed_annotation/freezed_annotation.dart';

part 'message_model.freezed.dart';
part 'message_model.g.dart';

@freezed
class MessageModel with _$MessageModel {
  factory MessageModel({
    required String title,
    required MessageContent content,
    required String vacancy,
    required List<String> publications,
  }) = _MessageModel;
  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}

@freezed
class Para with _$Para {
  factory Para({
    required String subHeading,
    required List<String> content,
  }) = _Para;
  factory Para.fromJson(Map<String, dynamic> json) => _$ParaFromJson(json);
}

@freezed
class MessageContent with _$MessageContent {
  factory MessageContent({
    required String heading,
    required List<Para> topics,
    required String contact,
    required String focus,
    required String focusDetail,
  }) = _MessageContent;
  factory MessageContent.fromJson(Map<String, dynamic> json) =>
      _$MessageContentFromJson(json);
}
