import 'package:freezed_annotation/freezed_annotation.dart';

part 'social_media_model.freezed.dart';
part 'social_media_model.g.dart';

@freezed
class SocialMediaModel with _$SocialMediaModel {
  factory SocialMediaModel({
    required String link,
    required String imgSrc,
    required String color,
    required double padding,
    String? text,
    String? txtColor,
    required String id,
  }) = _SocialMediaModel;
  factory SocialMediaModel.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaModelFromJson(json);
}
