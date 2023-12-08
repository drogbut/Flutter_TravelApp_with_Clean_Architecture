import '../../domain/entities/fare_details_by_segment.dart';
import 'included_checked_bags_model.dart';

class FareDetailsBySegmentModel extends FareDetailsBySegment {
  const FareDetailsBySegmentModel({
    String? segmentId,
    String? cabin,
    String? fareBasis,
    String? brandedFare,
    String? classe,
    IncludedCheckedBagsModel? includedCheckedBags,
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
      includedCheckedBags: IncludedCheckedBagsModel.fromJson(
        json['includedCheckedBags'] as Map<String, dynamic>,
      ),
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
