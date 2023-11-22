// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PriceImpl _$$PriceImplFromJson(Map<String, dynamic> json) => _$PriceImpl(
      currency: json['currency'] as String?,
      total: (json['total'] as num?)?.toDouble(),
      base: (json['base'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PriceImplToJson(_$PriceImpl instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'total': instance.total,
      'base': instance.base,
    };
