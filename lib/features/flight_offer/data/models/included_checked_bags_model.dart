import '../../domain/entities/included_checked_bags.dart';

class IncludedCheckedBagsModel extends IncludedCheckedBags {
  const IncludedCheckedBagsModel({
    num? quantity,
  }) : super(quantity: quantity);

  factory IncludedCheckedBagsModel.fromJson(Map<String, dynamic> json) {
    return IncludedCheckedBagsModel(
      quantity: json['quantity'] as num?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'quantity': quantity,
    };
  }
}
