import 'package:equatable/equatable.dart';

/// amount : "0.00"
/// type : "SUPPLIER"

class Fees extends Equatable {
  final String? amount;
  final String? type;

  const Fees({this.amount, this.type});

  @override
  List<Object?> get props => [amount, type];
}
