import 'package:equatable/equatable.dart';

/// iataCode : "NSI"
/// at : "2024-01-02T22:05:00"

class Departure extends Equatable {
  final String? iataCode;
  final String? at;

  const Departure({required this.iataCode, required this.at});

  @override
  List<Object?> get props => [iataCode, at];
}
