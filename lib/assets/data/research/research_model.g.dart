// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'research_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ResearchModelImpl _$$ResearchModelImplFromJson(Map<String, dynamic> json) =>
    _$ResearchModelImpl(
      imgSrc: json['imgSrc'] as String,
      heading: json['heading'] as String,
      text: (json['text'] as List<dynamic>)
          .map((e) => Text.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ResearchModelImplToJson(_$ResearchModelImpl instance) =>
    <String, dynamic>{
      'imgSrc': instance.imgSrc,
      'heading': instance.heading,
      'text': instance.text,
    };

_$TextListImpl _$$TextListImplFromJson(Map<String, dynamic> json) =>
    _$TextListImpl(
      heading: json['heading'] as String,
      items: (json['items'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$TextListImplToJson(_$TextListImpl instance) =>
    <String, dynamic>{
      'heading': instance.heading,
      'items': instance.items,
    };

_$TextImpl _$$TextImplFromJson(Map<String, dynamic> json) => _$TextImpl(
      title: json['title'] as String?,
      content: json['content'] as String,
      list: json['list'] == null
          ? null
          : TextList.fromJson(json['list'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TextImplToJson(_$TextImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'list': instance.list,
    };
