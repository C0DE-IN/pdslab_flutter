import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_model.freezed.dart';
part 'contact_model.g.dart';

@freezed
class ContactModel with _$ContactModel {
  factory ContactModel({
    required String name,
    required String position,
    required String labName,
    required String labNumber,
    required String department,
    required String division,
    required String institute,
    required List<String> address,
    required String email,
    required String tel,
    required String map,
  }) = _ContactModel;
  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);
}
