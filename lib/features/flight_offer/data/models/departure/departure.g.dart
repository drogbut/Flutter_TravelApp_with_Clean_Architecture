// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepartureImpl _$$DepartureImplFromJson(Map<String, dynamic> json) =>
    _$DepartureImpl(
      iataCode: json['iataCode'] as String?,
      terminal: json['terminal'] as String?,
      at: json['at'] as String?,
    );

Map<String, dynamic> _$$DepartureImplToJson(_$DepartureImpl instance) =>
    <String, dynamic>{
      'iataCode': instance.iataCode,
      'terminal': instance.terminal,
      'at': instance.at,
    };
