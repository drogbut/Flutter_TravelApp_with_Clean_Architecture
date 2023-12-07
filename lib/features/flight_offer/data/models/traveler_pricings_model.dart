import '../../domain/entities/fare_details_by_segment.dart';
import '../../domain/entities/price.dart';
import '../../domain/entities/traveler_pricings.dart';

class TravelerPricingsModel extends TravelerPricings {
  const TravelerPricingsModel({
    String? travelerId,
    String? fareOption,
    required String travelerType,
    Price? price,
    List<FareDetailsBySegment>? fareDetailsBySegment,
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
      travelerType: json['travelerType'] as String,
      price: json['price'] as Price?,
      fareDetailsBySegment:
          json['fareDetailsBySegment'] as List<FareDetailsBySegment>?,
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
