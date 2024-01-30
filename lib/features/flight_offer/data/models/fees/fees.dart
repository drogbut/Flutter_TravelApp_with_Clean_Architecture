import 'package:freezed_annotation/freezed_annotation.dart';

part 'fees.freezed.dart';
part 'fees.g.dart';

@freezed
class Fees with _$Fees {
  const factory Fees({String? amount, String? type}) = _Fees;

  factory Fees.fromJson(Map<String, Object?> json) => _$FeesFromJson(json);
}
