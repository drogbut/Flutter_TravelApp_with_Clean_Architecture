import 'package:travel_app/features/flight_offer/data/models/fees_model.dart';

import '../../domain/entities/price_with_fees.dart';

class PriceWithFeesModel extends PriceWithFees {
  const PriceWithFeesModel({
    String? currency,
    String? total,
    String? base,
    List<FeesModel>? fees,
    String? grandTotal,
  }) : super(
          currency: currency,
          total: total,
          base: base,
          fees: fees,
          grandTotal: grandTotal,
        );

  factory PriceWithFeesModel.fromJson(Map<String, dynamic> json) {
    return PriceWithFeesModel(
      currency: json['currency'] as String?,
      total: json['total'] as String?,
      base: json['base'] as String?,
      fees: (json['fees'] as List<dynamic>?)
          ?.map((e) => FeesModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      grandTotal: json['grandTotal'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'total': total,
      'base': base,
      'fees': fees,
      'grandTotal': grandTotal,
    };
  }
}
