import 'package:equatable/equatable.dart';

/// code : "333"

class Aircraft extends Equatable {
  final String? code;

  const Aircraft({this.code});

  @override
  List<Object?> get props => [code];
}
