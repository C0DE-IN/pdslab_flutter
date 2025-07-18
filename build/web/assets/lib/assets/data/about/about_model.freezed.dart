// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'about_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AboutModel _$AboutModelFromJson(Map<String, dynamic> json) {
  return _AboutModel.fromJson(json);
}

/// @nodoc
mixin _$AboutModel {
  String get heading => throw _privateConstructorUsedError;
  List<String> get content => throw _privateConstructorUsedError;
  String get author => throw _privateConstructorUsedError;

  /// Serializes this AboutModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AboutModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AboutModelCopyWith<AboutModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AboutModelCopyWith<$Res> {
  factory $AboutModelCopyWith(
          AboutModel value, $Res Function(AboutModel) then) =
      _$AboutModelCopyWithImpl<$Res, AboutModel>;
  @useResult
  $Res call({String heading, List<String> content, String author});
}

/// @nodoc
class _$AboutModelCopyWithImpl<$Res, $Val extends AboutModel>
    implements $AboutModelCopyWith<$Res> {
  _$AboutModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AboutModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? heading = null,
    Object? content = null,
    Object? author = null,
  }) {
    return _then(_value.copyWith(
      heading: null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<String>,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AboutModelImplCopyWith<$Res>
    implements $AboutModelCopyWith<$Res> {
  factory _$$AboutModelImplCopyWith(
          _$AboutModelImpl value, $Res Function(_$AboutModelImpl) then) =
      __$$AboutModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String heading, List<String> content, String author});
}

/// @nodoc
class __$$AboutModelImplCopyWithImpl<$Res>
    extends _$AboutModelCopyWithImpl<$Res, _$AboutModelImpl>
    implements _$$AboutModelImplCopyWith<$Res> {
  __$$AboutModelImplCopyWithImpl(
      _$AboutModelImpl _value, $Res Function(_$AboutModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AboutModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? heading = null,
    Object? content = null,
    Object? author = null,
  }) {
    return _then(_$AboutModelImpl(
      heading: null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<String>,
      author: null == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AboutModelImpl implements _AboutModel {
  _$AboutModelImpl(
      {required this.heading,
      required final List<String> content,
      required this.author})
      : _content = content;

  factory _$AboutModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$AboutModelImplFromJson(json);

  @override
  final String heading;
  final List<String> _content;
  @override
  List<String> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  final String author;

  @override
  String toString() {
    return 'AboutModel(heading: $heading, content: $content, author: $author)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AboutModelImpl &&
            (identical(other.heading, heading) || other.heading == heading) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            (identical(other.author, author) || other.author == author));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, heading,
      const DeepCollectionEquality().hash(_content), author);

  /// Create a copy of AboutModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AboutModelImplCopyWith<_$AboutModelImpl> get copyWith =>
      __$$AboutModelImplCopyWithImpl<_$AboutModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AboutModelImplToJson(
      this,
    );
  }
}

abstract class _AboutModel implements AboutModel {
  factory _AboutModel(
      {required final String heading,
      required final List<String> content,
      required final String author}) = _$AboutModelImpl;

  factory _AboutModel.fromJson(Map<String, dynamic> json) =
      _$AboutModelImpl.fromJson;

  @override
  String get heading;
  @override
  List<String> get content;
  @override
  String get author;

  /// Create a copy of AboutModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AboutModelImplCopyWith<_$AboutModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
