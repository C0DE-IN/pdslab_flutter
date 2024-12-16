// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'agency_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AgencyModel _$AgencyModelFromJson(Map<String, dynamic> json) {
  return _AgencyModel.fromJson(json);
}

/// @nodoc
mixin _$AgencyModel {
  String get svgId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;
  String get alt => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  /// Serializes this AgencyModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AgencyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AgencyModelCopyWith<AgencyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AgencyModelCopyWith<$Res> {
  factory $AgencyModelCopyWith(
          AgencyModel value, $Res Function(AgencyModel) then) =
      _$AgencyModelCopyWithImpl<$Res, AgencyModel>;
  @useResult
  $Res call(
      {String svgId,
      String name,
      String logo,
      String alt,
      String link,
      String type,
      String title});
}

/// @nodoc
class _$AgencyModelCopyWithImpl<$Res, $Val extends AgencyModel>
    implements $AgencyModelCopyWith<$Res> {
  _$AgencyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AgencyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? svgId = null,
    Object? name = null,
    Object? logo = null,
    Object? alt = null,
    Object? link = null,
    Object? type = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      svgId: null == svgId
          ? _value.svgId
          : svgId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      alt: null == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AgencyModelImplCopyWith<$Res>
    implements $AgencyModelCopyWith<$Res> {
  factory _$$AgencyModelImplCopyWith(
          _$AgencyModelImpl value, $Res Function(_$AgencyModelImpl) then) =
      __$$AgencyModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String svgId,
      String name,
      String logo,
      String alt,
      String link,
      String type,
      String title});
}

/// @nodoc
class __$$AgencyModelImplCopyWithImpl<$Res>
    extends _$AgencyModelCopyWithImpl<$Res, _$AgencyModelImpl>
    implements _$$AgencyModelImplCopyWith<$Res> {
  __$$AgencyModelImplCopyWithImpl(
      _$AgencyModelImpl _value, $Res Function(_$AgencyModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AgencyModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? svgId = null,
    Object? name = null,
    Object? logo = null,
    Object? alt = null,
    Object? link = null,
    Object? type = null,
    Object? title = null,
  }) {
    return _then(_$AgencyModelImpl(
      svgId: null == svgId
          ? _value.svgId
          : svgId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: null == logo
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      alt: null == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AgencyModelImpl implements _AgencyModel {
  _$AgencyModelImpl(
      {required this.svgId,
      required this.name,
      required this.logo,
      required this.alt,
      required this.link,
      required this.type,
      required this.title});

  factory _$AgencyModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AgencyModelImplFromJson(json);

  @override
  final String svgId;
  @override
  final String name;
  @override
  final String logo;
  @override
  final String alt;
  @override
  final String link;
  @override
  final String type;
  @override
  final String title;

  @override
  String toString() {
    return 'AgencyModel(svgId: $svgId, name: $name, logo: $logo, alt: $alt, link: $link, type: $type, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AgencyModelImpl &&
            (identical(other.svgId, svgId) || other.svgId == svgId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.logo, logo) || other.logo == logo) &&
            (identical(other.alt, alt) || other.alt == alt) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, svgId, name, logo, alt, link, type, title);

  /// Create a copy of AgencyModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AgencyModelImplCopyWith<_$AgencyModelImpl> get copyWith =>
      __$$AgencyModelImplCopyWithImpl<_$AgencyModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AgencyModelImplToJson(
      this,
    );
  }
}

abstract class _AgencyModel implements AgencyModel {
  factory _AgencyModel(
      {required final String svgId,
      required final String name,
      required final String logo,
      required final String alt,
      required final String link,
      required final String type,
      required final String title}) = _$AgencyModelImpl;

  factory _AgencyModel.fromJson(Map<String, dynamic> json) =
      _$AgencyModelImpl.fromJson;

  @override
  String get svgId;
  @override
  String get name;
  @override
  String get logo;
  @override
  String get alt;
  @override
  String get link;
  @override
  String get type;
  @override
  String get title;

  /// Create a copy of AgencyModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AgencyModelImplCopyWith<_$AgencyModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
