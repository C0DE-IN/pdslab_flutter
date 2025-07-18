// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'people_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PeopleModel _$PeopleModelFromJson(Map<String, dynamic> json) {
  return _PeopleModel.fromJson(json);
}

/// @nodoc
mixin _$PeopleModel {
  String? get title => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get imgSrc => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  List<String>? get credentials => throw _privateConstructorUsedError;
  List<String>? get summary => throw _privateConstructorUsedError;
  String? get fellowships => throw _privateConstructorUsedError;

  /// Serializes this PeopleModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PeopleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PeopleModelCopyWith<PeopleModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PeopleModelCopyWith<$Res> {
  factory $PeopleModelCopyWith(
          PeopleModel value, $Res Function(PeopleModel) then) =
      _$PeopleModelCopyWithImpl<$Res, PeopleModel>;
  @useResult
  $Res call(
      {String? title,
      String name,
      String? imgSrc,
      String position,
      String? email,
      List<String>? credentials,
      List<String>? summary,
      String? fellowships});
}

/// @nodoc
class _$PeopleModelCopyWithImpl<$Res, $Val extends PeopleModel>
    implements $PeopleModelCopyWith<$Res> {
  _$PeopleModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PeopleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? name = null,
    Object? imgSrc = freezed,
    Object? position = null,
    Object? email = freezed,
    Object? credentials = freezed,
    Object? summary = freezed,
    Object? fellowships = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imgSrc: freezed == imgSrc
          ? _value.imgSrc
          : imgSrc // ignore: cast_nullable_to_non_nullable
              as String?,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      credentials: freezed == credentials
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      fellowships: freezed == fellowships
          ? _value.fellowships
          : fellowships // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PeopleModelImplCopyWith<$Res>
    implements $PeopleModelCopyWith<$Res> {
  factory _$$PeopleModelImplCopyWith(
          _$PeopleModelImpl value, $Res Function(_$PeopleModelImpl) then) =
      __$$PeopleModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title,
      String name,
      String? imgSrc,
      String position,
      String? email,
      List<String>? credentials,
      List<String>? summary,
      String? fellowships});
}

/// @nodoc
class __$$PeopleModelImplCopyWithImpl<$Res>
    extends _$PeopleModelCopyWithImpl<$Res, _$PeopleModelImpl>
    implements _$$PeopleModelImplCopyWith<$Res> {
  __$$PeopleModelImplCopyWithImpl(
      _$PeopleModelImpl _value, $Res Function(_$PeopleModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PeopleModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? name = null,
    Object? imgSrc = freezed,
    Object? position = null,
    Object? email = freezed,
    Object? credentials = freezed,
    Object? summary = freezed,
    Object? fellowships = freezed,
  }) {
    return _then(_$PeopleModelImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      imgSrc: freezed == imgSrc
          ? _value.imgSrc
          : imgSrc // ignore: cast_nullable_to_non_nullable
              as String?,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      credentials: freezed == credentials
          ? _value._credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      summary: freezed == summary
          ? _value._summary
          : summary // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      fellowships: freezed == fellowships
          ? _value.fellowships
          : fellowships // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PeopleModelImpl implements _PeopleModel {
  _$PeopleModelImpl(
      {this.title,
      required this.name,
      this.imgSrc,
      required this.position,
      this.email,
      final List<String>? credentials,
      final List<String>? summary,
      this.fellowships})
      : _credentials = credentials,
        _summary = summary;

  factory _$PeopleModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PeopleModelImplFromJson(json);

  @override
  final String? title;
  @override
  final String name;
  @override
  final String? imgSrc;
  @override
  final String position;
  @override
  final String? email;
  final List<String>? _credentials;
  @override
  List<String>? get credentials {
    final value = _credentials;
    if (value == null) return null;
    if (_credentials is EqualUnmodifiableListView) return _credentials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _summary;
  @override
  List<String>? get summary {
    final value = _summary;
    if (value == null) return null;
    if (_summary is EqualUnmodifiableListView) return _summary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? fellowships;

  @override
  String toString() {
    return 'PeopleModel(title: $title, name: $name, imgSrc: $imgSrc, position: $position, email: $email, credentials: $credentials, summary: $summary, fellowships: $fellowships)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PeopleModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imgSrc, imgSrc) || other.imgSrc == imgSrc) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other._credentials, _credentials) &&
            const DeepCollectionEquality().equals(other._summary, _summary) &&
            (identical(other.fellowships, fellowships) ||
                other.fellowships == fellowships));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      name,
      imgSrc,
      position,
      email,
      const DeepCollectionEquality().hash(_credentials),
      const DeepCollectionEquality().hash(_summary),
      fellowships);

  /// Create a copy of PeopleModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PeopleModelImplCopyWith<_$PeopleModelImpl> get copyWith =>
      __$$PeopleModelImplCopyWithImpl<_$PeopleModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PeopleModelImplToJson(
      this,
    );
  }
}

abstract class _PeopleModel implements PeopleModel {
  factory _PeopleModel(
      {final String? title,
      required final String name,
      final String? imgSrc,
      required final String position,
      final String? email,
      final List<String>? credentials,
      final List<String>? summary,
      final String? fellowships}) = _$PeopleModelImpl;

  factory _PeopleModel.fromJson(Map<String, dynamic> json) =
      _$PeopleModelImpl.fromJson;

  @override
  String? get title;
  @override
  String get name;
  @override
  String? get imgSrc;
  @override
  String get position;
  @override
  String? get email;
  @override
  List<String>? get credentials;
  @override
  List<String>? get summary;
  @override
  String? get fellowships;

  /// Create a copy of PeopleModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PeopleModelImplCopyWith<_$PeopleModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
