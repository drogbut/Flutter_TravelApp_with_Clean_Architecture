import 'package:equatable/equatable.dart';

/// carrierCode : "SN"

class Operating extends Equatable {
  const Operating({this.carrierCode});
  final String? carrierCode;

  @override
  List<Object?> get props => [carrierCode];
}
