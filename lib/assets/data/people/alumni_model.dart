import 'package:freezed_annotation/freezed_annotation.dart';

part 'alumni_model.freezed.dart';
part 'alumni_model.g.dart';

@freezed
class AlumniModel with _$AlumniModel {
  factory AlumniModel({
    required String name,
    final String? degree,
    final String? passout,
    required String position,
    required String place,
  }) = _AlumniModel;
  factory AlumniModel.fromJson(Map<String, dynamic> json) =>
      _$AlumniModelFromJson(json);
}
