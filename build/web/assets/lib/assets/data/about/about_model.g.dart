// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AboutModelImpl _$$AboutModelImplFromJson(Map<String, dynamic> json) =>
    _$AboutModelImpl(
      heading: json['heading'] as String,
      content:
          (json['content'] as List<dynamic>).map((e) => e as String).toList(),
      author: json['author'] as String,
    );

Map<String, dynamic> _$$AboutModelImplToJson(_$AboutModelImpl instance) =>
    <String, dynamic>{
      'heading': instance.heading,
      'content': instance.content,
      'author': instance.author,
    };
