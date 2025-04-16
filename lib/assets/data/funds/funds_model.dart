import 'package:freezed_annotation/freezed_annotation.dart';

part 'funds_model.freezed.dart';
part 'funds_model.g.dart';

@freezed
class FundsModel with _$FundsModel {
  const factory FundsModel({
    required String title,
    required String period,
    required String agency,
  }) = _FundsModel;

  factory FundsModel.fromJson(Map<String, dynamic> json) =>
      _$FundsModelFromJson(json);
}
