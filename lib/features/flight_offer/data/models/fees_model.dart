import '../../domain/entities/fees.dart';

class FeesModel extends Fees {
  const FeesModel({
    String? amount,
    String? type,
  }) : super(
          amount: amount,
          type: type,
        );

  factory FeesModel.fromJson(Map<String, dynamic> json) {
    return FeesModel(
      amount: json['amount'] as String?,
      type: json['type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'type': type,
    };
  }
}
