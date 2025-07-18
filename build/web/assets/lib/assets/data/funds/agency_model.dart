import 'package:freezed_annotation/freezed_annotation.dart';

part 'agency_model.freezed.dart';
part 'agency_model.g.dart';

@freezed
class AgencyModel with _$AgencyModel {
  factory AgencyModel({
    required String svgId,
    required String name,
    required String logo,
    required String alt,
    required String link,
    required String type,
    required String title,
  }) = _AgencyModel;
  factory AgencyModel.fromJson(Map<String, dynamic> json) =>
      _$AgencyModelFromJson(json);
}
