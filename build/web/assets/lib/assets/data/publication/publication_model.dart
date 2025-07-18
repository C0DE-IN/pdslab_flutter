import 'package:freezed_annotation/freezed_annotation.dart';

part 'publication_model.freezed.dart';
part 'publication_model.g.dart';

@freezed
class PublicationModel with _$PublicationModel {
  factory PublicationModel({
    required String year,
    required List<Article> articles,
  }) = _PublicationModel;
  factory PublicationModel.fromJson(Map<String, dynamic> json) =>
      _$PublicationModelFromJson(json);
}

@freezed
class Article with _$Article {
  factory Article({
    required List<String> authors,
    required String title,
    required String journal,
    required String issue,
    String? pubmed,
    required String link,
    String? highlight,
    bool? preprint,
    String? pdf,
  }) = _Article;
  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
