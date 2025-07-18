// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notice_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NoticeModelImpl _$$NoticeModelImplFromJson(Map<String, dynamic> json) =>
    _$NoticeModelImpl(
      text: json['text'] as String,
      img: json['img'] as String?,
      imgText: json['imgText'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$$NoticeModelImplToJson(_$NoticeModelImpl instance) =>
    <String, dynamic>{
      'text': instance.text,
      'img': instance.img,
      'imgText': instance.imgText,
      'link': instance.link,
    };
