import 'package:freezed_annotation/freezed_annotation.dart';

/// weight : 45
/// weightUnit : "KG"

part 'included_checked_bags.freezed.dart';
part 'included_checked_bags.g.dart';

@freezed
class IncludedCheckedBags with _$IncludedCheckedBags {
  const factory IncludedCheckedBags({
    required int? weight,
    required int? weightUnit,
  }) = _IncludedCheckedBags;

  factory IncludedCheckedBags.fromJson(Map<String, Object?> json) =>
      _$IncludedCheckedBagsFromJson(json);
}
