// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_media_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SocialMediaModelImpl _$$SocialMediaModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SocialMediaModelImpl(
      link: json['link'] as String,
      imgSrc: json['imgSrc'] as String,
      color: json['color'] as String,
      text: json['text'] as String?,
      txtColor: json['txtColor'] as String?,
      id: json['id'] as String,
    );

Map<String, dynamic> _$$SocialMediaModelImplToJson(
        _$SocialMediaModelImpl instance) =>
    <String, dynamic>{
      'link': instance.link,
      'imgSrc': instance.imgSrc,
      'color': instance.color,
      'text': instance.text,
      'txtColor': instance.txtColor,
      'id': instance.id,
    };
