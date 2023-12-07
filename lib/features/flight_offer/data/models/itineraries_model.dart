import '../../domain/entities/itineraries.dart';
import '../../domain/entities/segments.dart';

class ItinerariesModel extends Itineraries {
  const ItinerariesModel({
    String? duration,
    List<Segments>? segments,
  }) : super(
          duration: duration,
          segments: segments,
        );

  factory ItinerariesModel.fromJson(Map<String, dynamic> json) {
    return ItinerariesModel(
      duration: json['duration'] as String?,
      segments: json['segments'] as List<Segments>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'duration': duration,
      'segments': segments,
    };
  }
}
