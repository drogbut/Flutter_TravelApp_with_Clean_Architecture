import '../../domain/entities/pricing_options.dart';

class PricingOptionsModel extends PricingOptions {
  const PricingOptionsModel({
    List<dynamic>? fareType,
    bool? includedCheckedBagsOnly,
  }) : super(
          fareType: fareType,
          includedCheckedBagsOnly: includedCheckedBagsOnly,
        );

  factory PricingOptionsModel.fromJson(Map<String, dynamic> json) {
    return PricingOptionsModel(
      fareType: json['fareType'] as List<dynamic>?,
      includedCheckedBagsOnly: json['includedCheckedBagsOnly'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'fareType': fareType,
      'includedCheckedBagsOnly': includedCheckedBagsOnly,
    };
  }
}
