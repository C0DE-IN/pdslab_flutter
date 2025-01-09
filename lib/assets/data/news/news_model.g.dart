// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsModelImpl _$$NewsModelImplFromJson(Map<String, dynamic> json) =>
    _$NewsModelImpl(
      column: json['column'] as String?,
      headline: json['headline'] as String,
      placeDate: json['place_date'] as String?,
      link: json['link'] as String,
      logo: json['logo'] as String,
      id: json['id'] as String,
      poster: json['poster'] as String?,
      type: json['type'] as String,
    );

Map<String, dynamic> _$$NewsModelImplToJson(_$NewsModelImpl instance) =>
    <String, dynamic>{
      'column': instance.column,
      'headline': instance.headline,
      'place_date': instance.placeDate,
      'link': instance.link,
      'logo': instance.logo,
      'id': instance.id,
      'poster': instance.poster,
      'type': instance.type,
    };
