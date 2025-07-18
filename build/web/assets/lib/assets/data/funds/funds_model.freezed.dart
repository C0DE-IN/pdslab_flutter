// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'funds_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

FundsModel _$FundsModelFromJson(Map<String, dynamic> json) {
  return _FundsModel.fromJson(json);
}

/// @nodoc
mixin _$FundsModel {
  String get title => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;
  String get agency => throw _privateConstructorUsedError;

  /// Serializes this FundsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FundsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FundsModelCopyWith<FundsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FundsModelCopyWith<$Res> {
  factory $FundsModelCopyWith(
          FundsModel value, $Res Function(FundsModel) then) =
      _$FundsModelCopyWithImpl<$Res, FundsModel>;
  @useResult
  $Res call({String title, String period, String agency});
}

/// @nodoc
class _$FundsModelCopyWithImpl<$Res, $Val extends FundsModel>
    implements $FundsModelCopyWith<$Res> {
  _$FundsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FundsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? period = null,
    Object? agency = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      agency: null == agency
          ? _value.agency
          : agency // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FundsModelImplCopyWith<$Res>
    implements $FundsModelCopyWith<$Res> {
  factory _$$FundsModelImplCopyWith(
          _$FundsModelImpl value, $Res Function(_$FundsModelImpl) then) =
      __$$FundsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String title, String period, String agency});
}

/// @nodoc
class __$$FundsModelImplCopyWithImpl<$Res>
    extends _$FundsModelCopyWithImpl<$Res, _$FundsModelImpl>
    implements _$$FundsModelImplCopyWith<$Res> {
  __$$FundsModelImplCopyWithImpl(
      _$FundsModelImpl _value, $Res Function(_$FundsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of FundsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? period = null,
    Object? agency = null,
  }) {
    return _then(_$FundsModelImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      agency: null == agency
          ? _value.agency
          : agency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FundsModelImpl implements _FundsModel {
  const _$FundsModelImpl(
      {required this.title, required this.period, required this.agency});

  factory _$FundsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FundsModelImplFromJson(json);

  @override
  final String title;
  @override
  final String period;
  @override
  final String agency;

  @override
  String toString() {
    return 'FundsModel(title: $title, period: $period, agency: $agency)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FundsModelImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.agency, agency) || other.agency == agency));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, title, period, agency);

  /// Create a copy of FundsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FundsModelImplCopyWith<_$FundsModelImpl> get copyWith =>
      __$$FundsModelImplCopyWithImpl<_$FundsModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FundsModelImplToJson(
      this,
    );
  }
}

abstract class _FundsModel implements FundsModel {
  const factory _FundsModel(
      {required final String title,
      required final String period,
      required final String agency}) = _$FundsModelImpl;

  factory _FundsModel.fromJson(Map<String, dynamic> json) =
      _$FundsModelImpl.fromJson;

  @override
  String get title;
  @override
  String get period;
  @override
  String get agency;

  /// Create a copy of FundsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FundsModelImplCopyWith<_$FundsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
