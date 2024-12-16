import 'package:freezed_annotation/freezed_annotation.dart';

part 'research_area_model.freezed.dart';
part 'research_area_model.g.dart';

@freezed
class ResearchAreaModel with _$ResearchAreaModel {
  factory ResearchAreaModel({
    required String heading,
    required String imgSrc,
    required String text,
  }) = _ResearchAreaModel;
  factory ResearchAreaModel.fromJson(Map<String, dynamic> json) =>
      _$ResearchAreaModelFromJson(json);
}
