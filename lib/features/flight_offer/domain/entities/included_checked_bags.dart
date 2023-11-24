import 'package:equatable/equatable.dart';

/// quantity : 1

class IncludedCheckedBags extends Equatable {
  const IncludedCheckedBags({
    this.quantity,
  });

  final num? quantity;

  @override
  List<Object?> get props => [quantity];
}
