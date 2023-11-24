import 'package:equatable/equatable.dart';

/// iataCode : "BRU"
/// at : "2024-01-03T05:05:00"

class Arrival extends Equatable {
  final String? iataCode;
  final String? at;

  const Arrival({required this.iataCode, this.at});

  @override
  List<Object?> get props => [iataCode, at];
}
