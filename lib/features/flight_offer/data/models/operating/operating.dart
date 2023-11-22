import 'package:freezed_annotation/freezed_annotation.dart';

/// carrierCode : "QH"
part 'operating.freezed.dart';
part 'operating.g.dart';

@freezed
class Operating with _$Operating {
  const factory Operating({
    required String? carrierCode,
  }) = _Operating;

  factory Operating.fromJson(Map<String, Object?> json) =>
      _$OperatingFromJson(json);
}
