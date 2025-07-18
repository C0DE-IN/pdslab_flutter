// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alumni_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlumniModelImpl _$$AlumniModelImplFromJson(Map<String, dynamic> json) =>
    _$AlumniModelImpl(
      name: json['name'] as String,
      degree: json['degree'] as String?,
      passout: json['passout'] as String?,
      position: json['position'] as String,
      place: json['place'] as String,
    );

Map<String, dynamic> _$$AlumniModelImplToJson(_$AlumniModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'degree': instance.degree,
      'passout': instance.passout,
      'position': instance.position,
      'place': instance.place,
    };
