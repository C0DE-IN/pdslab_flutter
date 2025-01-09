import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_model.freezed.dart';
part 'news_model.g.dart';

@freezed
class NewsModel with _$NewsModel {
  factory NewsModel({
    String? column,
    required String headline,
    @JsonKey(name: 'place_date') String? placeDate,
    required String link,
    required String logo,
    required String id,
    String? poster,
    required String type,
  }) = _NewsModel;
  
  factory NewsModel.fromJson(Map<String, dynamic> json) =>
      _$NewsModelFromJson(json);
}
