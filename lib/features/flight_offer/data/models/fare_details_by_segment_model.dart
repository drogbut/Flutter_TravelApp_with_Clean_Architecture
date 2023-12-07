import '../../domain/entities/fare_details_by_segment.dart';
import '../../domain/entities/included_checked_bags.dart';

class FareDetailsBySegmentModel extends FareDetailsBySegment {
  const FareDetailsBySegmentModel({
    String? segmentId,
    String? cabin,
    String? fareBasis,
    String? brandedFare,
    String? classe,
    IncludedCheckedBags? includedCheckedBags,
  }) : super(
          segmentId: segmentId,
          cabin: cabin,
          fareBasis: fareBasis,
          brandedFare: brandedFare,
          classe: classe,
          includedCheckedBags: includedCheckedBags,
        );

  factory FareDetailsBySegmentModel.fromJson(Map<String, dynamic> json) {
    return FareDetailsBySegmentModel(
      segmentId: json['segmentId'] as String?,
      cabin: json['cabin'] as String?,
      fareBasis: json['fareBasis'] as String?,
      brandedFare: json['brandedFare'] as String?,
      classe: json['class'] as String?,
      includedCheckedBags: json['includedCheckedBags'] as IncludedCheckedBags?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'segmentId': segmentId,
      'cabin': cabin,
      'fareBasis': fareBasis,
      'brandedFare': brandedFare,
      'class': classe,
      'includedCheckedBags': includedCheckedBags,
    };
  }
}
