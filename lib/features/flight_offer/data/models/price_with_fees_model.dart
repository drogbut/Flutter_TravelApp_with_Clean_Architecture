import '../../domain/entities/fees.dart';
import '../../domain/entities/price_with_fees.dart';

class PriceWithFeesModel extends PriceWithFees {
  const PriceWithFeesModel({
    String? currency,
    String? total,
    String? base,
    List<Fees>? fees,
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
      fees: json['fees'] as List<Fees>?,
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
