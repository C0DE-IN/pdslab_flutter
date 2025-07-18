// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'publication_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PublicationModel _$PublicationModelFromJson(Map<String, dynamic> json) {
  return _PublicationModel.fromJson(json);
}

/// @nodoc
mixin _$PublicationModel {
  String get year => throw _privateConstructorUsedError;
  List<Article> get articles => throw _privateConstructorUsedError;

  /// Serializes this PublicationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PublicationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PublicationModelCopyWith<PublicationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PublicationModelCopyWith<$Res> {
  factory $PublicationModelCopyWith(
          PublicationModel value, $Res Function(PublicationModel) then) =
      _$PublicationModelCopyWithImpl<$Res, PublicationModel>;
  @useResult
  $Res call({String year, List<Article> articles});
}

/// @nodoc
class _$PublicationModelCopyWithImpl<$Res, $Val extends PublicationModel>
    implements $PublicationModelCopyWith<$Res> {
  _$PublicationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PublicationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? articles = null,
  }) {
    return _then(_value.copyWith(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      articles: null == articles
          ? _value.articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PublicationModelImplCopyWith<$Res>
    implements $PublicationModelCopyWith<$Res> {
  factory _$$PublicationModelImplCopyWith(_$PublicationModelImpl value,
          $Res Function(_$PublicationModelImpl) then) =
      __$$PublicationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String year, List<Article> articles});
}

/// @nodoc
class __$$PublicationModelImplCopyWithImpl<$Res>
    extends _$PublicationModelCopyWithImpl<$Res, _$PublicationModelImpl>
    implements _$$PublicationModelImplCopyWith<$Res> {
  __$$PublicationModelImplCopyWithImpl(_$PublicationModelImpl _value,
      $Res Function(_$PublicationModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of PublicationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? year = null,
    Object? articles = null,
  }) {
    return _then(_$PublicationModelImpl(
      year: null == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as String,
      articles: null == articles
          ? _value._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<Article>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PublicationModelImpl implements _PublicationModel {
  _$PublicationModelImpl(
      {required this.year, required final List<Article> articles})
      : _articles = articles;

  factory _$PublicationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PublicationModelImplFromJson(json);

  @override
  final String year;
  final List<Article> _articles;
  @override
  List<Article> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  @override
  String toString() {
    return 'PublicationModel(year: $year, articles: $articles)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PublicationModelImpl &&
            (identical(other.year, year) || other.year == year) &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, year, const DeepCollectionEquality().hash(_articles));

  /// Create a copy of PublicationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PublicationModelImplCopyWith<_$PublicationModelImpl> get copyWith =>
      __$$PublicationModelImplCopyWithImpl<_$PublicationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PublicationModelImplToJson(
      this,
    );
  }
}

abstract class _PublicationModel implements PublicationModel {
  factory _PublicationModel(
      {required final String year,
      required final List<Article> articles}) = _$PublicationModelImpl;

  factory _PublicationModel.fromJson(Map<String, dynamic> json) =
      _$PublicationModelImpl.fromJson;

  @override
  String get year;
  @override
  List<Article> get articles;

  /// Create a copy of PublicationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PublicationModelImplCopyWith<_$PublicationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Article _$ArticleFromJson(Map<String, dynamic> json) {
  return _Article.fromJson(json);
}

/// @nodoc
mixin _$Article {
  List<String> get authors => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get journal => throw _privateConstructorUsedError;
  String get issue => throw _privateConstructorUsedError;
  String? get pubmed => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String? get highlight => throw _privateConstructorUsedError;
  bool? get preprint => throw _privateConstructorUsedError;
  String? get pdf => throw _privateConstructorUsedError;

  /// Serializes this Article to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Article
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ArticleCopyWith<Article> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleCopyWith<$Res> {
  factory $ArticleCopyWith(Article value, $Res Function(Article) then) =
      _$ArticleCopyWithImpl<$Res, Article>;
  @useResult
  $Res call(
      {List<String> authors,
      String title,
      String journal,
      String issue,
      String? pubmed,
      String link,
      String? highlight,
      bool? preprint,
      String? pdf});
}

/// @nodoc
class _$ArticleCopyWithImpl<$Res, $Val extends Article>
    implements $ArticleCopyWith<$Res> {
  _$ArticleCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Article
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authors = null,
    Object? title = null,
    Object? journal = null,
    Object? issue = null,
    Object? pubmed = freezed,
    Object? link = null,
    Object? highlight = freezed,
    Object? preprint = freezed,
    Object? pdf = freezed,
  }) {
    return _then(_value.copyWith(
      authors: null == authors
          ? _value.authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      journal: null == journal
          ? _value.journal
          : journal // ignore: cast_nullable_to_non_nullable
              as String,
      issue: null == issue
          ? _value.issue
          : issue // ignore: cast_nullable_to_non_nullable
              as String,
      pubmed: freezed == pubmed
          ? _value.pubmed
          : pubmed // ignore: cast_nullable_to_non_nullable
              as String?,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      highlight: freezed == highlight
          ? _value.highlight
          : highlight // ignore: cast_nullable_to_non_nullable
              as String?,
      preprint: freezed == preprint
          ? _value.preprint
          : preprint // ignore: cast_nullable_to_non_nullable
              as bool?,
      pdf: freezed == pdf
          ? _value.pdf
          : pdf // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArticleImplCopyWith<$Res> implements $ArticleCopyWith<$Res> {
  factory _$$ArticleImplCopyWith(
          _$ArticleImpl value, $Res Function(_$ArticleImpl) then) =
      __$$ArticleImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> authors,
      String title,
      String journal,
      String issue,
      String? pubmed,
      String link,
      String? highlight,
      bool? preprint,
      String? pdf});
}

/// @nodoc
class __$$ArticleImplCopyWithImpl<$Res>
    extends _$ArticleCopyWithImpl<$Res, _$ArticleImpl>
    implements _$$ArticleImplCopyWith<$Res> {
  __$$ArticleImplCopyWithImpl(
      _$ArticleImpl _value, $Res Function(_$ArticleImpl) _then)
      : super(_value, _then);

  /// Create a copy of Article
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? authors = null,
    Object? title = null,
    Object? journal = null,
    Object? issue = null,
    Object? pubmed = freezed,
    Object? link = null,
    Object? highlight = freezed,
    Object? preprint = freezed,
    Object? pdf = freezed,
  }) {
    return _then(_$ArticleImpl(
      authors: null == authors
          ? _value._authors
          : authors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      journal: null == journal
          ? _value.journal
          : journal // ignore: cast_nullable_to_non_nullable
              as String,
      issue: null == issue
          ? _value.issue
          : issue // ignore: cast_nullable_to_non_nullable
              as String,
      pubmed: freezed == pubmed
          ? _value.pubmed
          : pubmed // ignore: cast_nullable_to_non_nullable
              as String?,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      highlight: freezed == highlight
          ? _value.highlight
          : highlight // ignore: cast_nullable_to_non_nullable
              as String?,
      preprint: freezed == preprint
          ? _value.preprint
          : preprint // ignore: cast_nullable_to_non_nullable
              as bool?,
      pdf: freezed == pdf
          ? _value.pdf
          : pdf // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArticleImpl implements _Article {
  _$ArticleImpl(
      {required final List<String> authors,
      required this.title,
      required this.journal,
      required this.issue,
      this.pubmed,
      required this.link,
      this.highlight,
      this.preprint,
      this.pdf})
      : _authors = authors;

  factory _$ArticleImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArticleImplFromJson(json);

  final List<String> _authors;
  @override
  List<String> get authors {
    if (_authors is EqualUnmodifiableListView) return _authors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_authors);
  }

  @override
  final String title;
  @override
  final String journal;
  @override
  final String issue;
  @override
  final String? pubmed;
  @override
  final String link;
  @override
  final String? highlight;
  @override
  final bool? preprint;
  @override
  final String? pdf;

  @override
  String toString() {
    return 'Article(authors: $authors, title: $title, journal: $journal, issue: $issue, pubmed: $pubmed, link: $link, highlight: $highlight, preprint: $preprint, pdf: $pdf)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArticleImpl &&
            const DeepCollectionEquality().equals(other._authors, _authors) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.journal, journal) || other.journal == journal) &&
            (identical(other.issue, issue) || other.issue == issue) &&
            (identical(other.pubmed, pubmed) || other.pubmed == pubmed) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.highlight, highlight) ||
                other.highlight == highlight) &&
            (identical(other.preprint, preprint) ||
                other.preprint == preprint) &&
            (identical(other.pdf, pdf) || other.pdf == pdf));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_authors),
      title,
      journal,
      issue,
      pubmed,
      link,
      highlight,
      preprint,
      pdf);

  /// Create a copy of Article
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ArticleImplCopyWith<_$ArticleImpl> get copyWith =>
      __$$ArticleImplCopyWithImpl<_$ArticleImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArticleImplToJson(
      this,
    );
  }
}

abstract class _Article implements Article {
  factory _Article(
      {required final List<String> authors,
      required final String title,
      required final String journal,
      required final String issue,
      final String? pubmed,
      required final String link,
      final String? highlight,
      final bool? preprint,
      final String? pdf}) = _$ArticleImpl;

  factory _Article.fromJson(Map<String, dynamic> json) = _$ArticleImpl.fromJson;

  @override
  List<String> get authors;
  @override
  String get title;
  @override
  String get journal;
  @override
  String get issue;
  @override
  String? get pubmed;
  @override
  String get link;
  @override
  String? get highlight;
  @override
  bool? get preprint;
  @override
  String? get pdf;

  /// Create a copy of Article
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ArticleImplCopyWith<_$ArticleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
