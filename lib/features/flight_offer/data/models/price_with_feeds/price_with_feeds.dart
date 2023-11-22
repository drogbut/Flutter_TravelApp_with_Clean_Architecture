import 'package:freezed_annotation/freezed_annotation.dart';

import '../fees/fees.dart';

/// currency : "EUR"
/// total : "179.67"
/// base : "60.00"
/// fees : [{"amount":"0.00","type":"SUPPLIER"},{"amount":"0.00","type":"TICKETING"}]
/// grandTotal : "179.67"

part 'price_with_feeds.freezed.dart';
part 'price_with_feeds.g.dart';

@freezed
class PriceWithFeeds with _$PriceWithFeeds {
  const factory PriceWithFeeds({
    required String? currency,
    required double? total,
    required double? base,
    required Fees? fees,
    required double? grandTotal,
  }) = _PriceWithFeeds;

  factory PriceWithFeeds.fromJson(Map<String, Object?> json) =>
      _$PriceWithFeedsFromJson(json);
}
