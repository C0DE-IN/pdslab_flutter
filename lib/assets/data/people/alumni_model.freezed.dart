// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'alumni_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AlumniModel _$AlumniModelFromJson(Map<String, dynamic> json) {
  return _AlumniModel.fromJson(json);
}

/// @nodoc
mixin _$AlumniModel {
  String get name => throw _privateConstructorUsedError;
  String? get degree => throw _privateConstructorUsedError;
  String? get passout => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  String get place => throw _privateConstructorUsedError;

  /// Serializes this AlumniModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AlumniModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AlumniModelCopyWith<AlumniModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AlumniModelCopyWith<$Res> {
  factory $AlumniModelCopyWith(
          AlumniModel value, $Res Function(AlumniModel) then) =
      _$AlumniModelCopyWithImpl<$Res, AlumniModel>;
  @useResult
  $Res call(
      {String name,
      String? degree,
      String? passout,
      String position,
      String place});
}

/// @nodoc
class _$AlumniModelCopyWithImpl<$Res, $Val extends AlumniModel>
    implements $AlumniModelCopyWith<$Res> {
  _$AlumniModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AlumniModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? degree = freezed,
    Object? passout = freezed,
    Object? position = null,
    Object? place = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      degree: freezed == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String?,
      passout: freezed == passout
          ? _value.passout
          : passout // ignore: cast_nullable_to_non_nullable
              as String?,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AlumniModelImplCopyWith<$Res>
    implements $AlumniModelCopyWith<$Res> {
  factory _$$AlumniModelImplCopyWith(
          _$AlumniModelImpl value, $Res Function(_$AlumniModelImpl) then) =
      __$$AlumniModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String name,
      String? degree,
      String? passout,
      String position,
      String place});
}

/// @nodoc
class __$$AlumniModelImplCopyWithImpl<$Res>
    extends _$AlumniModelCopyWithImpl<$Res, _$AlumniModelImpl>
    implements _$$AlumniModelImplCopyWith<$Res> {
  __$$AlumniModelImplCopyWithImpl(
      _$AlumniModelImpl _value, $Res Function(_$AlumniModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AlumniModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? degree = freezed,
    Object? passout = freezed,
    Object? position = null,
    Object? place = null,
  }) {
    return _then(_$AlumniModelImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      degree: freezed == degree
          ? _value.degree
          : degree // ignore: cast_nullable_to_non_nullable
              as String?,
      passout: freezed == passout
          ? _value.passout
          : passout // ignore: cast_nullable_to_non_nullable
              as String?,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as String,
      place: null == place
          ? _value.place
          : place // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AlumniModelImpl implements _AlumniModel {
  _$AlumniModelImpl(
      {required this.name,
      this.degree,
      this.passout,
      required this.position,
      required this.place});

  factory _$AlumniModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AlumniModelImplFromJson(json);

  @override
  final String name;
  @override
  final String? degree;
  @override
  final String? passout;
  @override
  final String position;
  @override
  final String place;

  @override
  String toString() {
    return 'AlumniModel(name: $name, degree: $degree, passout: $passout, position: $position, place: $place)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AlumniModelImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.degree, degree) || other.degree == degree) &&
            (identical(other.passout, passout) || other.passout == passout) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.place, place) || other.place == place));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, degree, passout, position, place);

  /// Create a copy of AlumniModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AlumniModelImplCopyWith<_$AlumniModelImpl> get copyWith =>
      __$$AlumniModelImplCopyWithImpl<_$AlumniModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AlumniModelImplToJson(
      this,
    );
  }
}

abstract class _AlumniModel implements AlumniModel {
  factory _AlumniModel(
      {required final String name,
      final String? degree,
      final String? passout,
      required final String position,
      required final String place}) = _$AlumniModelImpl;

  factory _AlumniModel.fromJson(Map<String, dynamic> json) =
      _$AlumniModelImpl.fromJson;

  @override
  String get name;
  @override
  String? get degree;
  @override
  String? get passout;
  @override
  String get position;
  @override
  String get place;

  /// Create a copy of AlumniModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AlumniModelImplCopyWith<_$AlumniModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
