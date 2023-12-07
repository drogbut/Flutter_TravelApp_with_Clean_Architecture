import '../../domain/entities/price.dart';

class PriceModel extends Price {
  const PriceModel({
    String? currency,
    String? total,
    String? base,
  }) : super(
          currency: currency,
          total: total,
          base: base,
        );

  factory PriceModel.fromJson(Map<String, dynamic> json) {
    return PriceModel(
      currency: json['currency'] as String?,
      total: json['total'] as String?,
      base: json['base'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currency': currency,
      'total': total,
      'base': base,
    };
  }
}
