// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AgencyModelImpl _$$AgencyModelImplFromJson(Map<String, dynamic> json) =>
    _$AgencyModelImpl(
      svgId: json['svgId'] as String,
      name: json['name'] as String,
      logo: json['logo'] as String,
      alt: json['alt'] as String,
      link: json['link'] as String,
      type: json['type'] as String,
      title: json['title'] as String,
    );

Map<String, dynamic> _$$AgencyModelImplToJson(_$AgencyModelImpl instance) =>
    <String, dynamic>{
      'svgId': instance.svgId,
      'name': instance.name,
      'logo': instance.logo,
      'alt': instance.alt,
      'link': instance.link,
      'type': instance.type,
      'title': instance.title,
    };
