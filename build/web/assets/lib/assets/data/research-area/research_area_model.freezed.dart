// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'research_area_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResearchAreaModel _$ResearchAreaModelFromJson(Map<String, dynamic> json) {
  return _ResearchAreaModel.fromJson(json);
}

/// @nodoc
mixin _$ResearchAreaModel {
  String get heading => throw _privateConstructorUsedError;
  String get imgSrc => throw _privateConstructorUsedError;
  String get text => throw _privateConstructorUsedError;

  /// Serializes this ResearchAreaModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResearchAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResearchAreaModelCopyWith<ResearchAreaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResearchAreaModelCopyWith<$Res> {
  factory $ResearchAreaModelCopyWith(
          ResearchAreaModel value, $Res Function(ResearchAreaModel) then) =
      _$ResearchAreaModelCopyWithImpl<$Res, ResearchAreaModel>;
  @useResult
  $Res call({String heading, String imgSrc, String text});
}

/// @nodoc
class _$ResearchAreaModelCopyWithImpl<$Res, $Val extends ResearchAreaModel>
    implements $ResearchAreaModelCopyWith<$Res> {
  _$ResearchAreaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResearchAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? heading = null,
    Object? imgSrc = null,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      heading: null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as String,
      imgSrc: null == imgSrc
          ? _value.imgSrc
          : imgSrc // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResearchAreaModelImplCopyWith<$Res>
    implements $ResearchAreaModelCopyWith<$Res> {
  factory _$$ResearchAreaModelImplCopyWith(_$ResearchAreaModelImpl value,
          $Res Function(_$ResearchAreaModelImpl) then) =
      __$$ResearchAreaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String heading, String imgSrc, String text});
}

/// @nodoc
class __$$ResearchAreaModelImplCopyWithImpl<$Res>
    extends _$ResearchAreaModelCopyWithImpl<$Res, _$ResearchAreaModelImpl>
    implements _$$ResearchAreaModelImplCopyWith<$Res> {
  __$$ResearchAreaModelImplCopyWithImpl(_$ResearchAreaModelImpl _value,
      $Res Function(_$ResearchAreaModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResearchAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? heading = null,
    Object? imgSrc = null,
    Object? text = null,
  }) {
    return _then(_$ResearchAreaModelImpl(
      heading: null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as String,
      imgSrc: null == imgSrc
          ? _value.imgSrc
          : imgSrc // ignore: cast_nullable_to_non_nullable
              as String,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResearchAreaModelImpl implements _ResearchAreaModel {
  _$ResearchAreaModelImpl(
      {required this.heading, required this.imgSrc, required this.text});

  factory _$ResearchAreaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResearchAreaModelImplFromJson(json);

  @override
  final String heading;
  @override
  final String imgSrc;
  @override
  final String text;

  @override
  String toString() {
    return 'ResearchAreaModel(heading: $heading, imgSrc: $imgSrc, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResearchAreaModelImpl &&
            (identical(other.heading, heading) || other.heading == heading) &&
            (identical(other.imgSrc, imgSrc) || other.imgSrc == imgSrc) &&
            (identical(other.text, text) || other.text == text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, heading, imgSrc, text);

  /// Create a copy of ResearchAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResearchAreaModelImplCopyWith<_$ResearchAreaModelImpl> get copyWith =>
      __$$ResearchAreaModelImplCopyWithImpl<_$ResearchAreaModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResearchAreaModelImplToJson(
      this,
    );
  }
}

abstract class _ResearchAreaModel implements ResearchAreaModel {
  factory _ResearchAreaModel(
      {required final String heading,
      required final String imgSrc,
      required final String text}) = _$ResearchAreaModelImpl;

  factory _ResearchAreaModel.fromJson(Map<String, dynamic> json) =
      _$ResearchAreaModelImpl.fromJson;

  @override
  String get heading;
  @override
  String get imgSrc;
  @override
  String get text;

  /// Create a copy of ResearchAreaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResearchAreaModelImplCopyWith<_$ResearchAreaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
