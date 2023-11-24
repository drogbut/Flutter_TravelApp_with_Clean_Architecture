import 'package:equatable/equatable.dart';
import 'package:travel_app/features/flight_offer/domain/entities/included_checked_bags.dart';

/// segmentId : "103"
/// cabin : "ECONOMY"
/// fareBasis : "TNCOWCM"
/// brandedFare : "ECOSAVERA"
/// class : "T"
/// includedCheckedBags : {"quantity":1}

class FareDetailsBySegment extends Equatable {
  final String? segmentId;
  final String? cabin;
  final String? fareBasis;
  final String? brandedFare;
  final String? classe;
  final IncludedCheckedBags? includedCheckedBags;

  const FareDetailsBySegment({
    this.segmentId,
    this.cabin,
    this.fareBasis,
    this.brandedFare,
    this.classe,
    this.includedCheckedBags,
  });

  @override
  List<Object?> get props =>
      [segmentId, cabin, fareBasis, brandedFare, classe, includedCheckedBags];
}
