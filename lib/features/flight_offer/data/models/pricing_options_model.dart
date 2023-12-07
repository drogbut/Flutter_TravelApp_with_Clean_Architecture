import '../../domain/entities/pricing_options.dart';

class PricingOptionsModel extends PricingOptions {
  const PricingOptionsModel({
    List<String>? fareType,
    bool? includedCheckedBagsOnly,
  }) : super(
          fareType: fareType,
          includedCheckedBagsOnly: includedCheckedBagsOnly,
        );

  factory PricingOptionsModel.fromJson(Map<String, dynamic> json) {
    return PricingOptionsModel(
      fareType: json['fareType'] as List<String>?,
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
