// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PiModelImpl _$$PiModelImplFromJson(Map<String, dynamic> json) =>
    _$PiModelImpl(
      title: json['title'] as String,
      name: json['name'] as String,
      imgSrc: json['imgSrc'] as String?,
      position: json['position'] as String,
      email: json['email'] as String?,
      started: json['started'] as String?,
      credentials: (json['credentials'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      summary: (json['summary'] as List<dynamic>?)
          ?.map((e) => Content.fromJson(e as Map<String, dynamic>))
          .toList(),
      awards: (json['awards'] as List<dynamic>?)
          ?.map((e) => Award.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PiModelImplToJson(_$PiModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'name': instance.name,
      'imgSrc': instance.imgSrc,
      'position': instance.position,
      'email': instance.email,
      'started': instance.started,
      'credentials': instance.credentials,
      'summary': instance.summary,
      'awards': instance.awards,
    };

_$ContentListImpl _$$ContentListImplFromJson(Map<String, dynamic> json) =>
    _$ContentListImpl(
      title: json['title'] as String?,
      array:
          (json['array'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ContentListImplToJson(_$ContentListImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'array': instance.array,
    };

_$ContentImpl _$$ContentImplFromJson(Map<String, dynamic> json) =>
    _$ContentImpl(
      title: json['title'] as String?,
      imgSrc: json['imgSrc'] as String?,
      list: json['list'] == null
          ? null
          : ContentList.fromJson(json['list'] as Map<String, dynamic>),
      text: (json['text'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$ContentImplToJson(_$ContentImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'imgSrc': instance.imgSrc,
      'list': instance.list,
      'text': instance.text,
    };

_$AwardImpl _$$AwardImplFromJson(Map<String, dynamic> json) => _$AwardImpl(
      name: json['name'] as String,
      from: json['from'] as String,
      year: json['year'] as String,
    );

Map<String, dynamic> _$$AwardImplToJson(_$AwardImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'from': instance.from,
      'year': instance.year,
    };
