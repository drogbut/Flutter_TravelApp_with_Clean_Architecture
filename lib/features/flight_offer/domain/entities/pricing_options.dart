import 'package:equatable/equatable.dart';

/// fareType : ["PUBLISHED"]
/// includedCheckedBagsOnly : true

class PricingOptions extends Equatable {
  const PricingOptions({this.fareType, this.includedCheckedBagsOnly});

  final List<dynamic>? fareType;
  final bool? includedCheckedBagsOnly;

  @override
  List<Object?> get props => [fareType, includedCheckedBagsOnly];
}
