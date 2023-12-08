import 'package:travel_app/features/flight_offer/data/models/fare_details_by_segment_model.dart';
import 'package:travel_app/features/flight_offer/data/models/price_model.dart';

import '../../domain/entities/traveler_pricings.dart';

class TravelerPricingsModel extends TravelerPricings {
  const TravelerPricingsModel({
    String? travelerId,
    String? fareOption,
    String? travelerType,
    PriceModel? price,
    List<FareDetailsBySegmentModel>? fareDetailsBySegment,
  }) : super(
          travelerId: travelerId,
          fareOption: fareOption,
          travelerType: travelerType,
          price: price,
          fareDetailsBySegment: fareDetailsBySegment,
        );

  factory TravelerPricingsModel.fromJson(Map<String, dynamic> json) {
    return TravelerPricingsModel(
      travelerId: json['travelerId'] as String?,
      fareOption: json['fareOption'] as String?,
      travelerType: json['travelerType'] as String?,
      price: PriceModel.fromJson(json['price'] as Map<String, dynamic>),
      fareDetailsBySegment: (json['fareDetailsBySegment'] as List<dynamic>?)
          ?.map((e) =>
              FareDetailsBySegmentModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'travelerId': travelerId,
      'fareOption': fareOption,
      'travelerType': travelerType,
      'price': price,
      'fareDetailsBySegment': fareDetailsBySegment,
    };
  }
}
