import 'package:freezed_annotation/freezed_annotation.dart';

part 'people_model.freezed.dart';
part 'people_model.g.dart';

@freezed
class PeopleModel with _$PeopleModel {
  factory PeopleModel({
    String? title,
    required String name,
    String? imgSrc,
    required String position,
    String? email,
    List<String>? credentials,
    List<String>? summary,
    String? fellowships,
  }) = _PeopleModel;
  factory PeopleModel.fromJson(Map<String, dynamic> json) =>
      _$PeopleModelFromJson(json);
}
