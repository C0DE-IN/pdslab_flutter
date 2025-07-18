// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'publication_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PublicationModelImpl _$$PublicationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PublicationModelImpl(
      year: json['year'] as String,
      articles: (json['articles'] as List<dynamic>)
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PublicationModelImplToJson(
        _$PublicationModelImpl instance) =>
    <String, dynamic>{
      'year': instance.year,
      'articles': instance.articles,
    };

_$ArticleImpl _$$ArticleImplFromJson(Map<String, dynamic> json) =>
    _$ArticleImpl(
      authors:
          (json['authors'] as List<dynamic>).map((e) => e as String).toList(),
      title: json['title'] as String,
      journal: json['journal'] as String,
      issue: json['issue'] as String,
      pubmed: json['pubmed'] as String?,
      link: json['link'] as String,
      highlight: json['highlight'] as String?,
      preprint: json['preprint'] as bool?,
      pdf: json['pdf'] as String?,
    );

Map<String, dynamic> _$$ArticleImplToJson(_$ArticleImpl instance) =>
    <String, dynamic>{
      'authors': instance.authors,
      'title': instance.title,
      'journal': instance.journal,
      'issue': instance.issue,
      'pubmed': instance.pubmed,
      'link': instance.link,
      'highlight': instance.highlight,
      'preprint': instance.preprint,
      'pdf': instance.pdf,
    };
