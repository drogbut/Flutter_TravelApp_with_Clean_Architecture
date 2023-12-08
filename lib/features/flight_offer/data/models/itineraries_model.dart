import '../../domain/entities/itineraries.dart';
import 'segments_model.dart';

class ItinerariesModel extends Itineraries {
  const ItinerariesModel({
    String? duration,
    List<SegmentsModel>? segments,
  }) : super(
          duration: duration,
          segments: segments,
        );

  factory ItinerariesModel.fromJson(Map<String, dynamic> json) {
    return ItinerariesModel(
      duration: json['duration'] as String?,
      segments: (json['segments'] as List<dynamic>?)
          ?.map((e) => SegmentsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'duration': duration,
      'segments': segments,
    };
  }
}
