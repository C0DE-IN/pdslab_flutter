// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'research_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ResearchModel _$ResearchModelFromJson(Map<String, dynamic> json) {
  return _ResearchModel.fromJson(json);
}

/// @nodoc
mixin _$ResearchModel {
  String get imgSrc => throw _privateConstructorUsedError;
  String get heading => throw _privateConstructorUsedError;
  List<TextItem> get textItems => throw _privateConstructorUsedError;

  /// Serializes this ResearchModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ResearchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ResearchModelCopyWith<ResearchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResearchModelCopyWith<$Res> {
  factory $ResearchModelCopyWith(
          ResearchModel value, $Res Function(ResearchModel) then) =
      _$ResearchModelCopyWithImpl<$Res, ResearchModel>;
  @useResult
  $Res call({String imgSrc, String heading, List<TextItem> textItems});
}

/// @nodoc
class _$ResearchModelCopyWithImpl<$Res, $Val extends ResearchModel>
    implements $ResearchModelCopyWith<$Res> {
  _$ResearchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ResearchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgSrc = null,
    Object? heading = null,
    Object? textItems = null,
  }) {
    return _then(_value.copyWith(
      imgSrc: null == imgSrc
          ? _value.imgSrc
          : imgSrc // ignore: cast_nullable_to_non_nullable
              as String,
      heading: null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as String,
      textItems: null == textItems
          ? _value.textItems
          : textItems // ignore: cast_nullable_to_non_nullable
              as List<TextItem>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResearchModelImplCopyWith<$Res>
    implements $ResearchModelCopyWith<$Res> {
  factory _$$ResearchModelImplCopyWith(
          _$ResearchModelImpl value, $Res Function(_$ResearchModelImpl) then) =
      __$$ResearchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String imgSrc, String heading, List<TextItem> textItems});
}

/// @nodoc
class __$$ResearchModelImplCopyWithImpl<$Res>
    extends _$ResearchModelCopyWithImpl<$Res, _$ResearchModelImpl>
    implements _$$ResearchModelImplCopyWith<$Res> {
  __$$ResearchModelImplCopyWithImpl(
      _$ResearchModelImpl _value, $Res Function(_$ResearchModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ResearchModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? imgSrc = null,
    Object? heading = null,
    Object? textItems = null,
  }) {
    return _then(_$ResearchModelImpl(
      imgSrc: null == imgSrc
          ? _value.imgSrc
          : imgSrc // ignore: cast_nullable_to_non_nullable
              as String,
      heading: null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as String,
      textItems: null == textItems
          ? _value._textItems
          : textItems // ignore: cast_nullable_to_non_nullable
              as List<TextItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ResearchModelImpl implements _ResearchModel {
  _$ResearchModelImpl(
      {required this.imgSrc,
      required this.heading,
      required final List<TextItem> textItems})
      : _textItems = textItems;

  factory _$ResearchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResearchModelImplFromJson(json);

  @override
  final String imgSrc;
  @override
  final String heading;
  final List<TextItem> _textItems;
  @override
  List<TextItem> get textItems {
    if (_textItems is EqualUnmodifiableListView) return _textItems;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_textItems);
  }

  @override
  String toString() {
    return 'ResearchModel(imgSrc: $imgSrc, heading: $heading, textItems: $textItems)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResearchModelImpl &&
            (identical(other.imgSrc, imgSrc) || other.imgSrc == imgSrc) &&
            (identical(other.heading, heading) || other.heading == heading) &&
            const DeepCollectionEquality()
                .equals(other._textItems, _textItems));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, imgSrc, heading,
      const DeepCollectionEquality().hash(_textItems));

  /// Create a copy of ResearchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ResearchModelImplCopyWith<_$ResearchModelImpl> get copyWith =>
      __$$ResearchModelImplCopyWithImpl<_$ResearchModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResearchModelImplToJson(
      this,
    );
  }
}

abstract class _ResearchModel implements ResearchModel {
  factory _ResearchModel(
      {required final String imgSrc,
      required final String heading,
      required final List<TextItem> textItems}) = _$ResearchModelImpl;

  factory _ResearchModel.fromJson(Map<String, dynamic> json) =
      _$ResearchModelImpl.fromJson;

  @override
  String get imgSrc;
  @override
  String get heading;
  @override
  List<TextItem> get textItems;

  /// Create a copy of ResearchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ResearchModelImplCopyWith<_$ResearchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TextItem _$TextItemFromJson(Map<String, dynamic> json) {
  return _TextItem.fromJson(json);
}

/// @nodoc
mixin _$TextItem {
  String? get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  TextList? get list => throw _privateConstructorUsedError;

  /// Serializes this TextItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TextItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TextItemCopyWith<TextItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextItemCopyWith<$Res> {
  factory $TextItemCopyWith(TextItem value, $Res Function(TextItem) then) =
      _$TextItemCopyWithImpl<$Res, TextItem>;
  @useResult
  $Res call({String? title, String content, TextList? list});

  $TextListCopyWith<$Res>? get list;
}

/// @nodoc
class _$TextItemCopyWithImpl<$Res, $Val extends TextItem>
    implements $TextItemCopyWith<$Res> {
  _$TextItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TextItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? content = null,
    Object? list = freezed,
  }) {
    return _then(_value.copyWith(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      list: freezed == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as TextList?,
    ) as $Val);
  }

  /// Create a copy of TextItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TextListCopyWith<$Res>? get list {
    if (_value.list == null) {
      return null;
    }

    return $TextListCopyWith<$Res>(_value.list!, (value) {
      return _then(_value.copyWith(list: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TextItemImplCopyWith<$Res>
    implements $TextItemCopyWith<$Res> {
  factory _$$TextItemImplCopyWith(
          _$TextItemImpl value, $Res Function(_$TextItemImpl) then) =
      __$$TextItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? title, String content, TextList? list});

  @override
  $TextListCopyWith<$Res>? get list;
}

/// @nodoc
class __$$TextItemImplCopyWithImpl<$Res>
    extends _$TextItemCopyWithImpl<$Res, _$TextItemImpl>
    implements _$$TextItemImplCopyWith<$Res> {
  __$$TextItemImplCopyWithImpl(
      _$TextItemImpl _value, $Res Function(_$TextItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of TextItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = freezed,
    Object? content = null,
    Object? list = freezed,
  }) {
    return _then(_$TextItemImpl(
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      list: freezed == list
          ? _value.list
          : list // ignore: cast_nullable_to_non_nullable
              as TextList?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextItemImpl implements _TextItem {
  _$TextItemImpl({this.title, required this.content, this.list});

  factory _$TextItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextItemImplFromJson(json);

  @override
  final String? title;
  @override
  final String content;
  @override
  final TextList? list;

  @override
  String toString() {
    return 'TextItem(title: $title, content: $content, list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextItemImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.list, list) || other.list == list));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, content, list);

  /// Create a copy of TextItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TextItemImplCopyWith<_$TextItemImpl> get copyWith =>
      __$$TextItemImplCopyWithImpl<_$TextItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TextItemImplToJson(
      this,
    );
  }
}

abstract class _TextItem implements TextItem {
  factory _TextItem(
      {final String? title,
      required final String content,
      final TextList? list}) = _$TextItemImpl;

  factory _TextItem.fromJson(Map<String, dynamic> json) =
      _$TextItemImpl.fromJson;

  @override
  String? get title;
  @override
  String get content;
  @override
  TextList? get list;

  /// Create a copy of TextItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextItemImplCopyWith<_$TextItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TextList _$TextListFromJson(Map<String, dynamic> json) {
  return _TextList.fromJson(json);
}

/// @nodoc
mixin _$TextList {
  String get heading => throw _privateConstructorUsedError;
  List<String> get items => throw _privateConstructorUsedError;

  /// Serializes this TextList to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TextList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TextListCopyWith<TextList> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TextListCopyWith<$Res> {
  factory $TextListCopyWith(TextList value, $Res Function(TextList) then) =
      _$TextListCopyWithImpl<$Res, TextList>;
  @useResult
  $Res call({String heading, List<String> items});
}

/// @nodoc
class _$TextListCopyWithImpl<$Res, $Val extends TextList>
    implements $TextListCopyWith<$Res> {
  _$TextListCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TextList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? heading = null,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      heading: null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TextListImplCopyWith<$Res>
    implements $TextListCopyWith<$Res> {
  factory _$$TextListImplCopyWith(
          _$TextListImpl value, $Res Function(_$TextListImpl) then) =
      __$$TextListImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String heading, List<String> items});
}

/// @nodoc
class __$$TextListImplCopyWithImpl<$Res>
    extends _$TextListCopyWithImpl<$Res, _$TextListImpl>
    implements _$$TextListImplCopyWith<$Res> {
  __$$TextListImplCopyWithImpl(
      _$TextListImpl _value, $Res Function(_$TextListImpl) _then)
      : super(_value, _then);

  /// Create a copy of TextList
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? heading = null,
    Object? items = null,
  }) {
    return _then(_$TextListImpl(
      heading: null == heading
          ? _value.heading
          : heading // ignore: cast_nullable_to_non_nullable
              as String,
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TextListImpl implements _TextList {
  _$TextListImpl({required this.heading, required final List<String> items})
      : _items = items;

  factory _$TextListImpl.fromJson(Map<String, dynamic> json) =>
      _$$TextListImplFromJson(json);

  @override
  final String heading;
  final List<String> _items;
  @override
  List<String> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'TextList(heading: $heading, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TextListImpl &&
            (identical(other.heading, heading) || other.heading == heading) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, heading, const DeepCollectionEquality().hash(_items));

  /// Create a copy of TextList
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TextListImplCopyWith<_$TextListImpl> get copyWith =>
      __$$TextListImplCopyWithImpl<_$TextListImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TextListImplToJson(
      this,
    );
  }
}

abstract class _TextList implements TextList {
  factory _TextList(
      {required final String heading,
      required final List<String> items}) = _$TextListImpl;

  factory _TextList.fromJson(Map<String, dynamic> json) =
      _$TextListImpl.fromJson;

  @override
  String get heading;
  @override
  List<String> get items;

  /// Create a copy of TextList
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TextListImplCopyWith<_$TextListImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
