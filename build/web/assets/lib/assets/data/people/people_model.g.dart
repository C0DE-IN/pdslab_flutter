// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'people_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PeopleModelImpl _$$PeopleModelImplFromJson(Map<String, dynamic> json) =>
    _$PeopleModelImpl(
      title: json['title'] as String?,
      name: json['name'] as String,
      imgSrc: json['imgSrc'] as String?,
      position: json['position'] as String,
      email: json['email'] as String?,
      credentials: (json['credentials'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      summary:
          (json['summary'] as List<dynamic>?)?.map((e) => e as String).toList(),
      fellowships: json['fellowships'] as String?,
    );

Map<String, dynamic> _$$PeopleModelImplToJson(_$PeopleModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'name': instance.name,
      'imgSrc': instance.imgSrc,
      'position': instance.position,
      'email': instance.email,
      'credentials': instance.credentials,
      'summary': instance.summary,
      'fellowships': instance.fellowships,
    };
