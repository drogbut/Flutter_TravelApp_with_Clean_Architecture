import 'package:freezed_annotation/freezed_annotation.dart';

import '../fees/fees.dart';

part 'price_with_fees.freezed.dart';
part 'price_with_fees.g.dart';

@freezed
class PriceWithFees with _$PriceWithFees {
  const factory PriceWithFees({
    String? currency,
    String? total,
    String? base,
    List<Fees>? fees,
    String? grandTotal,
  }) = _PriceWithFees;

  factory PriceWithFees.fromJson(Map<String, Object?> json) =>
      _$PriceWithFeesFromJson(json);
}
