import 'package:freezed_annotation/freezed_annotation.dart';

/// amount : "0.00"
/// type : "SUPPLIER"

part 'fees.freezed.dart';
part 'fees.g.dart';

@freezed
class Fees with _$Fees {
  const factory Fees({
    required String? type,
    required double? amount,
  }) = _Fees;

  factory Fees.fromJson(Map<String, Object?> json) => _$FeesFromJson(json);
}
