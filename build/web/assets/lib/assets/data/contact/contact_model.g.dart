// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactModelImpl _$$ContactModelImplFromJson(Map<String, dynamic> json) =>
    _$ContactModelImpl(
      name: json['name'] as String,
      position: json['position'] as String,
      labName: json['labName'] as String,
      labNumber: json['labNumber'] as String,
      department: json['department'] as String,
      division: json['division'] as String,
      institute: json['institute'] as String,
      address:
          (json['address'] as List<dynamic>).map((e) => e as String).toList(),
      email: json['email'] as String,
      tel: json['tel'] as String,
      map: json['map'] as String,
    );

Map<String, dynamic> _$$ContactModelImplToJson(_$ContactModelImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'position': instance.position,
      'labName': instance.labName,
      'labNumber': instance.labNumber,
      'department': instance.department,
      'division': instance.division,
      'institute': instance.institute,
      'address': instance.address,
      'email': instance.email,
      'tel': instance.tel,
      'map': instance.map,
    };
