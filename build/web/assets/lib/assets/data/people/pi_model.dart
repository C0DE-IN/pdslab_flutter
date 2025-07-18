import 'package:freezed_annotation/freezed_annotation.dart';

part 'pi_model.freezed.dart';
part 'pi_model.g.dart';

@freezed
class PiModel with _$PiModel {
  factory PiModel({
    required String title,
    required String name,
    String? imgSrc,
    required String position,
    String? email,
    String? started,
    List<String>? credentials,
    List<Content>? summary,
    List<Award>? awards,
  }) = _PiModel;
  factory PiModel.fromJson(Map<String, dynamic> json) =>
      _$PiModelFromJson(json);
}

@freezed
class ContentList with _$ContentList {
  factory ContentList({
    String? title,
    List<String>? array,
  }) = _ContentList;
  factory ContentList.fromJson(Map<String, dynamic> json) =>
      _$ContentListFromJson(json);
}

@freezed
class Content with _$Content {
  factory Content({
    String? title,
    String? imgSrc,
    ContentList? list,
    required List<String> text,
  }) = _Content;
  factory Content.fromJson(Map<String, dynamic> json) =>
      _$ContentFromJson(json);
}

@freezed
class Award with _$Award {
  factory Award({
    required String name,
    required String from,
    required String year,
  }) = _Award;
  factory Award.fromJson(Map<String, dynamic> json) => _$AwardFromJson(json);
}
