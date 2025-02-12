// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_media_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SocialMediaModel _$SocialMediaModelFromJson(Map<String, dynamic> json) {
  return _SocialMediaModel.fromJson(json);
}

/// @nodoc
mixin _$SocialMediaModel {
  String get link => throw _privateConstructorUsedError;
  String get imgSrc => throw _privateConstructorUsedError;
  String get color => throw _privateConstructorUsedError;
  double get padding => throw _privateConstructorUsedError;
  String? get text => throw _privateConstructorUsedError;
  String? get txtColor => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;

  /// Serializes this SocialMediaModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SocialMediaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SocialMediaModelCopyWith<SocialMediaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialMediaModelCopyWith<$Res> {
  factory $SocialMediaModelCopyWith(
          SocialMediaModel value, $Res Function(SocialMediaModel) then) =
      _$SocialMediaModelCopyWithImpl<$Res, SocialMediaModel>;
  @useResult
  $Res call(
      {String link,
      String imgSrc,
      String color,
      double padding,
      String? text,
      String? txtColor,
      String id});
}

/// @nodoc
class _$SocialMediaModelCopyWithImpl<$Res, $Val extends SocialMediaModel>
    implements $SocialMediaModelCopyWith<$Res> {
  _$SocialMediaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SocialMediaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? imgSrc = null,
    Object? color = null,
    Object? padding = null,
    Object? text = freezed,
    Object? txtColor = freezed,
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      imgSrc: null == imgSrc
          ? _value.imgSrc
          : imgSrc // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      padding: null == padding
          ? _value.padding
          : padding // ignore: cast_nullable_to_non_nullable
              as double,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      txtColor: freezed == txtColor
          ? _value.txtColor
          : txtColor // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SocialMediaModelImplCopyWith<$Res>
    implements $SocialMediaModelCopyWith<$Res> {
  factory _$$SocialMediaModelImplCopyWith(_$SocialMediaModelImpl value,
          $Res Function(_$SocialMediaModelImpl) then) =
      __$$SocialMediaModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String link,
      String imgSrc,
      String color,
      double padding,
      String? text,
      String? txtColor,
      String id});
}

/// @nodoc
class __$$SocialMediaModelImplCopyWithImpl<$Res>
    extends _$SocialMediaModelCopyWithImpl<$Res, _$SocialMediaModelImpl>
    implements _$$SocialMediaModelImplCopyWith<$Res> {
  __$$SocialMediaModelImplCopyWithImpl(_$SocialMediaModelImpl _value,
      $Res Function(_$SocialMediaModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of SocialMediaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? link = null,
    Object? imgSrc = null,
    Object? color = null,
    Object? padding = null,
    Object? text = freezed,
    Object? txtColor = freezed,
    Object? id = null,
  }) {
    return _then(_$SocialMediaModelImpl(
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      imgSrc: null == imgSrc
          ? _value.imgSrc
          : imgSrc // ignore: cast_nullable_to_non_nullable
              as String,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as String,
      padding: null == padding
          ? _value.padding
          : padding // ignore: cast_nullable_to_non_nullable
              as double,
      text: freezed == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as String?,
      txtColor: freezed == txtColor
          ? _value.txtColor
          : txtColor // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SocialMediaModelImpl implements _SocialMediaModel {
  _$SocialMediaModelImpl(
      {required this.link,
      required this.imgSrc,
      required this.color,
      required this.padding,
      this.text,
      this.txtColor,
      required this.id});

  factory _$SocialMediaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SocialMediaModelImplFromJson(json);

  @override
  final String link;
  @override
  final String imgSrc;
  @override
  final String color;
  @override
  final double padding;
  @override
  final String? text;
  @override
  final String? txtColor;
  @override
  final String id;

  @override
  String toString() {
    return 'SocialMediaModel(link: $link, imgSrc: $imgSrc, color: $color, padding: $padding, text: $text, txtColor: $txtColor, id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SocialMediaModelImpl &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.imgSrc, imgSrc) || other.imgSrc == imgSrc) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.padding, padding) || other.padding == padding) &&
            (identical(other.text, text) || other.text == text) &&
            (identical(other.txtColor, txtColor) ||
                other.txtColor == txtColor) &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, link, imgSrc, color, padding, text, txtColor, id);

  /// Create a copy of SocialMediaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SocialMediaModelImplCopyWith<_$SocialMediaModelImpl> get copyWith =>
      __$$SocialMediaModelImplCopyWithImpl<_$SocialMediaModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SocialMediaModelImplToJson(
      this,
    );
  }
}

abstract class _SocialMediaModel implements SocialMediaModel {
  factory _SocialMediaModel(
      {required final String link,
      required final String imgSrc,
      required final String color,
      required final double padding,
      final String? text,
      final String? txtColor,
      required final String id}) = _$SocialMediaModelImpl;

  factory _SocialMediaModel.fromJson(Map<String, dynamic> json) =
      _$SocialMediaModelImpl.fromJson;

  @override
  String get link;
  @override
  String get imgSrc;
  @override
  String get color;
  @override
  double get padding;
  @override
  String? get text;
  @override
  String? get txtColor;
  @override
  String get id;

  /// Create a copy of SocialMediaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SocialMediaModelImplCopyWith<_$SocialMediaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
