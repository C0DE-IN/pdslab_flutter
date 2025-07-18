// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return _MessageModel.fromJson(json);
}

/// @nodoc
mixin _$MessageModel {
  String get title => throw _privateConstructorUsedError;
  MessageContent get content => throw _privateConstructorUsedError;
  String get vacancy => throw _privateConstructorUsedError;
  List<String> get publications => throw _privateConstructorUsedError;

  /// Serializes this MessageModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageModelCopyWith<MessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageModelCopyWith<$Res> {
  factory $MessageModelCopyWith(
          MessageModel value, $Res Function(MessageModel) then) =
      _$MessageModelCopyWithImpl<$Res, MessageModel>;
  @useResult
  $Res call(
      {String title,
      MessageContent content,
      String vacancy,
      List<String> publications});

  $MessageContentCopyWith<$Res> get content;
}

/// @nodoc
class _$MessageModelCopyWithImpl<$Res, $Val extends MessageModel>
    implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? vacancy = null,
    Object? publications = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as MessageContent,
      vacancy: null == vacancy
          ? _value.vacancy
          : vacancy // ignore: cast_nullable_to_non_nullable
              as String,
      publications: null == publications
          ? _value.publications
          : publications // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MessageContentCopyWith<$Res> get content {
    return $MessageContentCopyWith<$Res>(_value.content, (value) {
      return _then(_value.copyWith(content: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MessageModelImplCopyWith<$Res>
    implements $MessageModelCopyWith<$Res> {
  factory _$$MessageModelImplCopyWith(
          _$MessageModelImpl value, $Res Function(_$MessageModelImpl) then) =
      __$$MessageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      MessageContent content,
      String vacancy,
      List<String> publications});

  @override
  $MessageContentCopyWith<$Res> get content;
}

/// @nodoc
class __$$MessageModelImplCopyWithImpl<$Res>
    extends _$MessageModelCopyWithImpl<$Res, _$MessageModelImpl>
    implements _$$MessageModelImplCopyWith<$Res> {
  __$$MessageModelImplCopyWithImpl(
      _$MessageModelImpl _value, $Res Function(_$MessageModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? vacancy = null,
    Object? publications = null,
  }) {
    return _then(_$MessageModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as MessageContent,
      vacancy: null == vacancy
          ? _value.vacancy
          : vacancy // ignore: cast_nullable_to_non_nullable
              as String,
      publications: null == publications
          ? _value._publications
          : publications // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageModelImpl implements _MessageModel {
  _$MessageModelImpl(
      {required this.title,
      required this.content,
      required this.vacancy,
      required final List<String> publications})
      : _publications = publications;

  factory _$MessageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageModelImplFromJson(json);

  @override
  final String title;
  @override
  final MessageContent content;
  @override
  final String vacancy;
  final List<String> _publications;
  @override
  List<String> get publications {
    if (_publications is EqualUnmodifiableListView) return _publications;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_publications);
  }

  @override
  String toString() {
    return 'MessageModel(title: $title, content: $content, vacancy: $vacancy, publications: $publications)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.vacancy, vacancy) || other.vacancy == vacancy) &&
            const DeepCollectionEquality()
                .equals(other._publications, _publications));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, content, vacancy,
      const DeepCollectionEquality().hash(_publications));

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      __$$MessageModelImplCopyWithImpl<_$MessageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageModelImplToJson(
      this,
    );
  }
}

abstract class _MessageModel implements MessageModel {
  factory _MessageModel(
      {required final String title,
      required final MessageContent content,
      required final String vacancy,
      required final List<String> publications}) = _$MessageModelImpl;

  factory _MessageModel.fromJson(Map<String, dynamic> json) =
      _$MessageModelImpl.fromJson;

  @override
  String get title;
  @override
  MessageContent get content;
  @override
  String get vacancy;
  @override
  List<String> get publications;

  /// Create a copy of MessageModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageModelImplCopyWith<_$MessageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Para _$ParaFromJson(Map<String, dynamic> json) {
  return _Para.fromJson(json);
}

/// @nodoc
mixin _$Para {
  String get subHeading => throw _privateConstructorUsedError;
  List<String> get content => throw _privateConstructorUsedError;

  /// Serializes this Para to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Para
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ParaCopyWith<Para> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ParaCopyWith<$Res> {
  factory $ParaCopyWith(Para value, $Res Function(Para) then) =
      _$ParaCopyWithImpl<$Res, Para>;
  @useResult
  $Res call({String subHeading, List<String> content});
}

/// @nodoc
class _$ParaCopyWithImpl<$Res, $Val extends Para>
    implements $ParaCopyWith<$Res> {
  _$ParaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Para
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subHeading = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      subHeading: null == subHeading
          ? _value.subHeading
          : subHeading // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ParaImplCopyWith<$Res> implements $ParaCopyWith<$Res> {
  factory _$$ParaImplCopyWith(
          _$ParaImpl value, $Res Function(_$ParaImpl) then) =
      __$$ParaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String subHeading, List<String> content});
}

/// @nodoc
class __$$ParaImplCopyWithImpl<$Res>
    extends _$ParaCopyWithImpl<$Res, _$ParaImpl>
    implements _$$ParaImplCopyWith<$Res> {
  __$$ParaImplCopyWithImpl(_$ParaImpl _value, $Res Function(_$ParaImpl) _then)
      : super(_value, _then);

  /// Create a copy of Para
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subHeading = null,
    Object? content = null,
  }) {
    return _then(_$ParaImpl(
      subHeading: null == subHeading
          ? _value.subHeading
          : subHeading // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ParaImpl implements _Para {
  _$ParaImpl({required this.subHeading, required final List<String> content})
      : _content = content;

  factory _$ParaImpl.fromJson(Map<String, dynamic> json) =>
      _$$ParaImplFromJson(json);

  @override
  final String subHeading;
  final List<String> _content;
  @override
  List<String> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  @override
  String toString() {
    return 'Para(subHeading: $subHeading, content: $content)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParaImpl &&
            (identical(other.subHeading, subHeading) ||
                other.subHeading == subHeading) &&
            const DeepCollectionEquality().equals(other._content, _content));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, subHeading, const DeepCollectionEquality().hash(_content));

  /// Create a copy of Para
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParaImplCopyWith<_$ParaImpl> get copyWith =>
      __$$ParaImplCopyWithImpl<_$ParaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ParaImplToJson(
      this,
    );
  }
}

abstract class _Para implements Para {
  factory _Para(
      {required final String subHeading,
      required final List<String> content}) = _$ParaImpl;

  factory _Para.fromJson(Map<String, dynamic> json) = _$ParaImpl.fromJson;

  @override
  String get subHeading;
  @override
  List<String> get content;

  /// Create a copy of Para
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParaImplCopyWith<_$ParaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MessageContent _$MessageContentFromJson(Map<String, dynamic> json) {
  return _MessageContent.fromJson(json);
}

/// @nodoc
mixin _$MessageContent {
  String get heading => throw _privateConstructorUsedError;
  List<Para> get topics => throw _privateConstructorUsedError;
  String get contact => throw _privateConstructorUsedError;
  String get focus => throw _privateConstructorUsedError;
  String get focusDetail => throw _privateConstructorUsedError;

  /// Serializes this MessageContent to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MessageContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MessageContentCopyWith<MessageContent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageContentCopyWith<$Res> {
  factory $MessageContentCopyWith(
          MessageContent value, $Res Function(MessageContent) then) =
      _$MessageContentCopyWithImpl<$Res, MessageContent>;
  @useResult
  $Res call(
      {String heading,
      List<Para> topics,
      String contact,
      String focus,
      String focusDetail});
}

/// @nodoc
class _$MessageContentCopyWithImpl<$Res, $Val extends MessageContent>
    implements $MessageContentCopyWith<$Res> {
  _$MessageContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MessageContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? heading = null,
    Object? topics = null,
    Object? contact = null,
    Object? focus = null,
    Object? focusDetail = null,
  }) {
    return _then(_value.copyWith(
      heading: null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as String,
      topics: null == topics
          ? _value.topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<Para>,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
      focus: null == focus
          ? _value.focus
          : focus // ignore: cast_nullable_to_non_nullable
              as String,
      focusDetail: null == focusDetail
          ? _value.focusDetail
          : focusDetail // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageContentImplCopyWith<$Res>
    implements $MessageContentCopyWith<$Res> {
  factory _$$MessageContentImplCopyWith(_$MessageContentImpl value,
          $Res Function(_$MessageContentImpl) then) =
      __$$MessageContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String heading,
      List<Para> topics,
      String contact,
      String focus,
      String focusDetail});
}

/// @nodoc
class __$$MessageContentImplCopyWithImpl<$Res>
    extends _$MessageContentCopyWithImpl<$Res, _$MessageContentImpl>
    implements _$$MessageContentImplCopyWith<$Res> {
  __$$MessageContentImplCopyWithImpl(
      _$MessageContentImpl _value, $Res Function(_$MessageContentImpl) _then)
      : super(_value, _then);

  /// Create a copy of MessageContent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? heading = null,
    Object? topics = null,
    Object? contact = null,
    Object? focus = null,
    Object? focusDetail = null,
  }) {
    return _then(_$MessageContentImpl(
      heading: null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as String,
      topics: null == topics
          ? _value._topics
          : topics // ignore: cast_nullable_to_non_nullable
              as List<Para>,
      contact: null == contact
          ? _value.contact
          : contact // ignore: cast_nullable_to_non_nullable
              as String,
      focus: null == focus
          ? _value.focus
          : focus // ignore: cast_nullable_to_non_nullable
              as String,
      focusDetail: null == focusDetail
          ? _value.focusDetail
          : focusDetail // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageContentImpl implements _MessageContent {
  _$MessageContentImpl(
      {required this.heading,
      required final List<Para> topics,
      required this.contact,
      required this.focus,
      required this.focusDetail})
      : _topics = topics;

  factory _$MessageContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageContentImplFromJson(json);

  @override
  final String heading;
  final List<Para> _topics;
  @override
  List<Para> get topics {
    if (_topics is EqualUnmodifiableListView) return _topics;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topics);
  }

  @override
  final String contact;
  @override
  final String focus;
  @override
  final String focusDetail;

  @override
  String toString() {
    return 'MessageContent(heading: $heading, topics: $topics, contact: $contact, focus: $focus, focusDetail: $focusDetail)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageContentImpl &&
            (identical(other.heading, heading) || other.heading == heading) &&
            const DeepCollectionEquality().equals(other._topics, _topics) &&
            (identical(other.contact, contact) || other.contact == contact) &&
            (identical(other.focus, focus) || other.focus == focus) &&
            (identical(other.focusDetail, focusDetail) ||
                other.focusDetail == focusDetail));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      heading,
      const DeepCollectionEquality().hash(_topics),
      contact,
      focus,
      focusDetail);

  /// Create a copy of MessageContent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageContentImplCopyWith<_$MessageContentImpl> get copyWith =>
      __$$MessageContentImplCopyWithImpl<_$MessageContentImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageContentImplToJson(
      this,
    );
  }
}

abstract class _MessageContent implements MessageContent {
  factory _MessageContent(
      {required final String heading,
      required final List<Para> topics,
      required final String contact,
      required final String focus,
      required final String focusDetail}) = _$MessageContentImpl;

  factory _MessageContent.fromJson(Map<String, dynamic> json) =
      _$MessageContentImpl.fromJson;

  @override
  String get heading;
  @override
  List<Para> get topics;
  @override
  String get contact;
  @override
  String get focus;
  @override
  String get focusDetail;

  /// Create a copy of MessageContent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MessageContentImplCopyWith<_$MessageContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
