import '../../domain/entities/operating.dart';

class OperatingModel extends Operating {
  const OperatingModel({
    String? carrierCode,
  }) : super(
          carrierCode: carrierCode,
        );

  factory OperatingModel.fromJson(Map<String, dynamic> json) {
    return OperatingModel(
      carrierCode: json['carrierCode'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'carrierCode': carrierCode,
    };
  }
}
