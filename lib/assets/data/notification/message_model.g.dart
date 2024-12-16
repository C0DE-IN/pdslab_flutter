// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
      title: json['title'] as String,
      content: MessageContent.fromJson(json['content'] as Map<String, dynamic>),
      vacancy: json['vacancy'] as String,
      publications: (json['publications'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'vacancy': instance.vacancy,
      'publications': instance.publications,
    };

_$ParaImpl _$$ParaImplFromJson(Map<String, dynamic> json) => _$ParaImpl(
      subHeading: json['subHeading'] as String,
      content:
          (json['content'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ParaImplToJson(_$ParaImpl instance) =>
    <String, dynamic>{
      'subHeading': instance.subHeading,
      'content': instance.content,
    };

_$MessageContentImpl _$$MessageContentImplFromJson(Map<String, dynamic> json) =>
    _$MessageContentImpl(
      heading: json['heading'] as String,
      topics: (json['topics'] as List<dynamic>)
          .map((e) => Para.fromJson(e as Map<String, dynamic>))
          .toList(),
      contact: json['contact'] as String,
      focus: json['focus'] as String,
      focusDetail: json['focusDetail'] as String,
    );

Map<String, dynamic> _$$MessageContentImplToJson(
        _$MessageContentImpl instance) =>
    <String, dynamic>{
      'heading': instance.heading,
      'topics': instance.topics,
      'contact': instance.contact,
      'focus': instance.focus,
      'focusDetail': instance.focusDetail,
    };
