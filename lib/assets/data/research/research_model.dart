import 'package:freezed_annotation/freezed_annotation.dart';

part 'research_model.freezed.dart';
part 'research_model.g.dart';

@freezed
class ResearchModel with _$ResearchModel {
  factory ResearchModel({
    required String imgSrc,
    required String heading,
    required List<Text> text,
  }) = _ResearchModel;
  factory ResearchModel.fromJson(Map<String, dynamic> json) =>
      _$ResearchModelFromJson(json);
}

@freezed
class TextList with _$TextList {
  factory TextList({
    required String heading,
    required List<String> items,
  }) = _TextList;
  factory TextList.fromJson(Map<String, dynamic> json) =>
      _$TextListFromJson(json);
}

@freezed
class Text with _$Text {
  factory Text({
    String? title,
    required String content,
    TextList? list,
  }) = _Text;
  factory Text.fromJson(Map<String, dynamic> json) => _$TextFromJson(json);
}
