// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pi_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PiModel _$PiModelFromJson(Map<String, dynamic> json) {
  return _PiModel.fromJson(json);
}

/// @nodoc
mixin _$PiModel {
  String get title => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get imgSrc => throw _privateConstructorUsedError;
  String get position => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get started => throw _privateConstructorUsedError;
  List<String>? get credentials => throw _privateConstructorUsedError;
  List<Content>? get summary => throw _privateConstructorUsedError;
  List<Award>? get awards => throw _privateConstructorUsedError;

  /// Serializes this PiModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PiModelCopyWith<PiModel> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PiModelCopyWith<$Res> {
  factory $PiModelCopyWith(PiModel value, $Res Function(PiModel) then) =
      _$PiModelCopyWithImpl<$Res, PiModel>;
  @useResult
  $Res call(
      {String title,
      String name,
      String? imgSrc,
      String position,
      String? email,
      String? started,
      List<String>? credentials,
      List<Content>? summary,
      List<Award>? awards});
}

/// @nodoc
class _$PiModelCopyWithImpl<$Res, $Val extends PiModel>
    implements $PiModelCopyWith<$Res> {
  _$PiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? name = null,
    Object? imgSrc = freezed,
    Object? position = null,
    Object? email = freezed,
    Object? started = freezed,
    Object? credentials = freezed,
    Object? summary = freezed,
    Object? awards = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
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
      started: freezed == started
          ? _value.started
          : started // ignore: cast_nullable_to_non_nullable
              as String?,
      credentials: freezed == credentials
          ? _value.credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      summary: freezed == summary
          ? _value.summary
          : summary // ignore: cast_nullable_to_non_nullable
              as List<Content>?,
      awards: freezed == awards
          ? _value.awards
          : awards // ignore: cast_nullable_to_non_nullable
              as List<Award>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PiModelImplCopyWith<$Res> implements $PiModelCopyWith<$Res> {
  factory _$$PiModelImplCopyWith(
          _$PiModelImpl value, $Res Function(_$PiModelImpl) then) =
      __$$PiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String name,
      String? imgSrc,
      String position,
      String? email,
      String? started,
      List<String>? credentials,
      List<Content>? summary,
      List<Award>? awards});
}

/// @nodoc
class __$$PiModelImplCopyWithImpl<$Res>
    extends _$PiModelCopyWithImpl<$Res, _$PiModelImpl>
    implements _$$PiModelImplCopyWith<$Res> {
  __$$PiModelImplCopyWithImpl(
      _$PiModelImpl _value, $Res Function(_$PiModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PiModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? name = null,
    Object? imgSrc = freezed,
    Object? position = null,
    Object? email = freezed,
    Object? started = freezed,
    Object? credentials = freezed,
    Object? summary = freezed,
    Object? awards = freezed,
  }) {
    return _then(_$PiModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
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
      started: freezed == started
          ? _value.started
          : started // ignore: cast_nullable_to_non_nullable
              as String?,
      credentials: freezed == credentials
          ? _value._credentials
          : credentials // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      summary: freezed == summary
          ? _value._summary
          : summary // ignore: cast_nullable_to_non_nullable
              as List<Content>?,
      awards: freezed == awards
          ? _value._awards
          : awards // ignore: cast_nullable_to_non_nullable
              as List<Award>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PiModelImpl implements _PiModel {
  _$PiModelImpl(
      {required this.title,
      required this.name,
      this.imgSrc,
      required this.position,
      this.email,
      this.started,
      final List<String>? credentials,
      final List<Content>? summary,
      final List<Award>? awards})
      : _credentials = credentials,
        _summary = summary,
        _awards = awards;

  factory _$PiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PiModelImplFromJson(json);

  @override
  final String title;
  @override
  final String name;
  @override
  final String? imgSrc;
  @override
  final String position;
  @override
  final String? email;
  @override
  final String? started;
  final List<String>? _credentials;
  @override
  List<String>? get credentials {
    final value = _credentials;
    if (value == null) return null;
    if (_credentials is EqualUnmodifiableListView) return _credentials;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Content>? _summary;
  @override
  List<Content>? get summary {
    final value = _summary;
    if (value == null) return null;
    if (_summary is EqualUnmodifiableListView) return _summary;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Award>? _awards;
  @override
  List<Award>? get awards {
    final value = _awards;
    if (value == null) return null;
    if (_awards is EqualUnmodifiableListView) return _awards;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PiModel(title: $title, name: $name, imgSrc: $imgSrc, position: $position, email: $email, started: $started, credentials: $credentials, summary: $summary, awards: $awards)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PiModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.imgSrc, imgSrc) || other.imgSrc == imgSrc) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.started, started) || other.started == started) &&
            const DeepCollectionEquality()
                .equals(other._credentials, _credentials) &&
            const DeepCollectionEquality().equals(other._summary, _summary) &&
            const DeepCollectionEquality().equals(other._awards, _awards));
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
      started,
      const DeepCollectionEquality().hash(_credentials),
      const DeepCollectionEquality().hash(_summary),
      const DeepCollectionEquality().hash(_awards));

  /// Create a copy of PiModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PiModelImplCopyWith<_$PiModelImpl> get copyWith =>
      __$$PiModelImplCopyWithImpl<_$PiModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PiModelImplToJson(
      this,
    );
  }
}

abstract class _PiModel implements PiModel {
  factory _PiModel(
      {required final String title,
      required final String name,
      final String? imgSrc,
      required final String position,
      final String? email,
      final String? started,
      final List<String>? credentials,
      final List<Content>? summary,
      final List<Award>? awards}) = _$PiModelImpl;

  factory _PiModel.fromJson(Map<String, dynamic> json) = _$PiModelImpl.fromJson;

  @override
  String get title;
  @override
  String get name;
  @override
  String? get imgSrc;
  @override
  String get position;
  @override
  String? get email;
  @override
  String? get started;
  @override
  List<String>? get credentials;
  @override
  List<Content>? get summary;
  @override
  List<Award>? get awards;

  /// Create a copy of PiModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PiModelImplCopyWith<_$PiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ContentList _$ContentListFromJson(Map<String, dynamic> json) {
  return _ContentList.fromJson(json);
}

/// @nodoc
mixin _$ContentList {
  String? get title => throw _privateConstructorUsedError;
  List<String>? get array => throw _privateConstructorUsedError;

  /// Serializes this ContentList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ContentList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentListCopyWith<ContentList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentListCopyWith<$Res> {
  factory $ContentListCopyWith(
          ContentList value, $Res Function(ContentList) then) =
      _$ContentListCopyWithImpl<$Res, ContentList>;
  @useResult
  $Res call({String? title, List<String>? array});
}

/// @nodoc
class _$ContentListCopyWithImpl<$Res, $Val extends ContentList>
    implements $ContentListCopyWith<$Res> {
  _$ContentListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ContentList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? array = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      array: freezed == array
          ? _value.array
          : array // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ContentListImplCopyWith<$Res>
    implements $ContentListCopyWith<$Res> {
  factory _$$ContentListImplCopyWith(
          _$ContentListImpl value, $Res Function(_$ContentListImpl) then) =
      __$$ContentListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, List<String>? array});
}

/// @nodoc
class __$$ContentListImplCopyWithImpl<$Res>
    extends _$ContentListCopyWithImpl<$Res, _$ContentListImpl>
    implements _$$ContentListImplCopyWith<$Res> {
  __$$ContentListImplCopyWithImpl(
      _$ContentListImpl _value, $Res Function(_$ContentListImpl) _then)
      : super(_value, _then);

  /// Create a copy of ContentList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? array = freezed,
  }) {
    return _then(_$ContentListImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      array: freezed == array
          ? _value._array
          : array // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentListImpl implements _ContentList {
  _$ContentListImpl({this.title, final List<String>? array}) : _array = array;

  factory _$ContentListImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentListImplFromJson(json);

  @override
  final String? title;
  final List<String>? _array;
  @override
  List<String>? get array {
    final value = _array;
    if (value == null) return null;
    if (_array is EqualUnmodifiableListView) return _array;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ContentList(title: $title, array: $array)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentListImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._array, _array));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, title, const DeepCollectionEquality().hash(_array));

  /// Create a copy of ContentList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentListImplCopyWith<_$ContentListImpl> get copyWith =>
      __$$ContentListImplCopyWithImpl<_$ContentListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentListImplToJson(
      this,
    );
  }
}

abstract class _ContentList implements ContentList {
  factory _ContentList({final String? title, final List<String>? array}) =
      _$ContentListImpl;

  factory _ContentList.fromJson(Map<String, dynamic> json) =
      _$ContentListImpl.fromJson;

  @override
  String? get title;
  @override
  List<String>? get array;

  /// Create a copy of ContentList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentListImplCopyWith<_$ContentListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Content _$ContentFromJson(Map<String, dynamic> json) {
  return _Content.fromJson(json);
}

/// @nodoc
mixin _$Content {
  String? get title => throw _privateConstructorUsedError;
  String? get imgSrc => throw _privateConstructorUsedError;
  ContentList? get list => throw _privateConstructorUsedError;
  List<String> get text => throw _privateConstructorUsedError;

  /// Serializes this Content to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ContentCopyWith<Content> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ContentCopyWith<$Res> {
  factory $ContentCopyWith(Content value, $Res Function(Content) then) =
      _$ContentCopyWithImpl<$Res, Content>;
  @useResult
  $Res call(
      {String? title, String? imgSrc, ContentList? list, List<String> text});

  $ContentListCopyWith<$Res>? get list;
}

/// @nodoc
class _$ContentCopyWithImpl<$Res, $Val extends Content>
    implements $ContentCopyWith<$Res> {
  _$ContentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? imgSrc = freezed,
    Object? list = freezed,
    Object? text = null,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      imgSrc: freezed == imgSrc
          ? _value.imgSrc
          : imgSrc // ignore: cast_nullable_to_non_nullable
              as String?,
      list: freezed == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as ContentList?,
      text: null == text
          ? _value.text
          : text // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ContentListCopyWith<$Res>? get list {
    if (_value.list == null) {
      return null;
    }

    return $ContentListCopyWith<$Res>(_value.list!, (value) {
      return _then(_value.copyWith(list: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ContentImplCopyWith<$Res> implements $ContentCopyWith<$Res> {
  factory _$$ContentImplCopyWith(
          _$ContentImpl value, $Res Function(_$ContentImpl) then) =
      __$$ContentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? title, String? imgSrc, ContentList? list, List<String> text});

  @override
  $ContentListCopyWith<$Res>? get list;
}

/// @nodoc
class __$$ContentImplCopyWithImpl<$Res>
    extends _$ContentCopyWithImpl<$Res, _$ContentImpl>
    implements _$$ContentImplCopyWith<$Res> {
  __$$ContentImplCopyWithImpl(
      _$ContentImpl _value, $Res Function(_$ContentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? imgSrc = freezed,
    Object? list = freezed,
    Object? text = null,
  }) {
    return _then(_$ContentImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      imgSrc: freezed == imgSrc
          ? _value.imgSrc
          : imgSrc // ignore: cast_nullable_to_non_nullable
              as String?,
      list: freezed == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as ContentList?,
      text: null == text
          ? _value._text
          : text // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ContentImpl implements _Content {
  _$ContentImpl(
      {this.title, this.imgSrc, this.list, required final List<String> text})
      : _text = text;

  factory _$ContentImpl.fromJson(Map<String, dynamic> json) =>
      _$$ContentImplFromJson(json);

  @override
  final String? title;
  @override
  final String? imgSrc;
  @override
  final ContentList? list;
  final List<String> _text;
  @override
  List<String> get text {
    if (_text is EqualUnmodifiableListView) return _text;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_text);
  }

  @override
  String toString() {
    return 'Content(title: $title, imgSrc: $imgSrc, list: $list, text: $text)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ContentImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imgSrc, imgSrc) || other.imgSrc == imgSrc) &&
            (identical(other.list, list) || other.list == list) &&
            const DeepCollectionEquality().equals(other._text, _text));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, imgSrc, list,
      const DeepCollectionEquality().hash(_text));

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      __$$ContentImplCopyWithImpl<_$ContentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ContentImplToJson(
      this,
    );
  }
}

abstract class _Content implements Content {
  factory _Content(
      {final String? title,
      final String? imgSrc,
      final ContentList? list,
      required final List<String> text}) = _$ContentImpl;

  factory _Content.fromJson(Map<String, dynamic> json) = _$ContentImpl.fromJson;

  @override
  String? get title;
  @override
  String? get imgSrc;
  @override
  ContentList? get list;
  @override
  List<String> get text;

  /// Create a copy of Content
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ContentImplCopyWith<_$ContentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Award _$AwardFromJson(Map<String, dynamic> json) {
  return _Award.fromJson(json);
}

/// @nodoc
mixin _$Award {
  String get name => throw _privateConstructorUsedError;
  String get from => throw _privateConstructorUsedError;
  String get year => throw _privateConstructorUsedError;

  /// Serializes this Award to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Award
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AwardCopyWith<Award> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AwardCopyWith<$Res> {
  factory $AwardCopyWith(Award value, $Res Function(Award) then) =
      _$AwardCopyWithImpl<$Res, Award>;
  @useResult
  $Res call({String name, String from, String year});
}

/// @nodoc
class _$AwardCopyWithImpl<$Res, $Val extends Award>
    implements $AwardCopyWith<$Res> {
  _$AwardCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Award
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? from = null,
    Object? year = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AwardImplCopyWith<$Res> implements $AwardCopyWith<$Res> {
  factory _$$AwardImplCopyWith(
          _$AwardImpl value, $Res Function(_$AwardImpl) then) =
      __$$AwardImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String from, String year});
}

/// @nodoc
class __$$AwardImplCopyWithImpl<$Res>
    extends _$AwardCopyWithImpl<$Res, _$AwardImpl>
    implements _$$AwardImplCopyWith<$Res> {
  __$$AwardImplCopyWithImpl(
      _$AwardImpl _value, $Res Function(_$AwardImpl) _then)
      : super(_value, _then);

  /// Create a copy of Award
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? from = null,
    Object? year = null,
  }) {
    return _then(_$AwardImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      from: null == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String,
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AwardImpl implements _Award {
  _$AwardImpl({required this.name, required this.from, required this.year});

  factory _$AwardImpl.fromJson(Map<String, dynamic> json) =>
      _$$AwardImplFromJson(json);

  @override
  final String name;
  @override
  final String from;
  @override
  final String year;

  @override
  String toString() {
    return 'Award(name: $name, from: $from, year: $year)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AwardImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.year, year) || other.year == year));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, name, from, year);

  /// Create a copy of Award
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AwardImplCopyWith<_$AwardImpl> get copyWith =>
      __$$AwardImplCopyWithImpl<_$AwardImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AwardImplToJson(
      this,
    );
  }
}

abstract class _Award implements Award {
  factory _Award(
      {required final String name,
      required final String from,
      required final String year}) = _$AwardImpl;

  factory _Award.fromJson(Map<String, dynamic> json) = _$AwardImpl.fromJson;

  @override
  String get name;
  @override
  String get from;
  @override
  String get year;

  /// Create a copy of Award
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AwardImplCopyWith<_$AwardImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
