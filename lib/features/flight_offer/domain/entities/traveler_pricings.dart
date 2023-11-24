import 'package:equatable/equatable.dart';
import 'package:travel_app/features/flight_offer/domain/entities/fare_details_by_segment.dart';
import 'package:travel_app/features/flight_offer/domain/entities/price.dart';

/// travelerId : "1"
/// fareOption : "STANDARD"
/// travelerType : "ADULT"
/// price : {"currency":"EUR","total":"617.00","base":"347.00"}
/// fareDetailsBySegment : [{"segmentId":"103","cabin":"ECONOMY","fareBasis":"TNCOWCM","brandedFare":"ECOSAVERA","class":"T","includedCheckedBags":{"quantity":1}},{"segmentId":"104","cabin":"ECONOMY","fareBasis":"TNCOWCM","brandedFare":"ECOSAVERA","class":"T","includedCheckedBags":{"quantity":1}},{"segmentId":"105","cabin":"ECONOMY","fareBasis":"TNCOWCM","brandedFare":"ECOSAVERA","class":"T","includedCheckedBags":{"quantity":1}}]

class TravelerPricings extends Equatable {
  final String? travelerId;
  final String? fareOption;
  final String? travelerType;
  final Price? price;
  final List<FareDetailsBySegment>? fareDetailsBySegment;

  const TravelerPricings({
    this.travelerId,
    this.fareOption,
    required this.travelerType,
    this.price,
    this.fareDetailsBySegment,
  });

  @override
  List<Object?> get props =>
      [travelerId, fareOption, travelerType, price, fareDetailsBySegment];
}
