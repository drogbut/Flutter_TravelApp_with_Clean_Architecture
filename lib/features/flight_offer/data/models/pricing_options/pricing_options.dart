import 'package:freezed_annotation/freezed_annotation.dart';

/// fareType : ["PUBLISHED"]
/// includedCheckedBagsOnly : true

part 'pricing_options.freezed.dart';
part 'pricing_options.g.dart';

@freezed
class PricingOptions with _$PricingOptions {
  const factory PricingOptions({
    required String? fareType,
    required bool? includedCheckedBagsOnly,
  }) = _PricingOptions;

  factory PricingOptions.fromJson(Map<String, Object?> json) =>
      _$PricingOptionsFromJson(json);
}
