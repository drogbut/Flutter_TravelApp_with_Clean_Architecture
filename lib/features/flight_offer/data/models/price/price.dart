import 'package:freezed_annotation/freezed_annotation.dart';

/// currency : "EUR"
/// total : "179.67"
/// base : "60.00"

part 'price.freezed.dart';
part 'price.g.dart';

@freezed
class Price with _$Price {
  const factory Price({
    required String? currency,
    required double? total,
    required double? base,
  }) = _Price;

  factory Price.fromJson(Map<String, Object?> json) => _$PriceFromJson(json);
}
