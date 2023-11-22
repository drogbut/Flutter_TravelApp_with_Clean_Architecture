// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_with_feeds.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PriceWithFeedsImpl _$$PriceWithFeedsImplFromJson(Map<String, dynamic> json) =>
    _$PriceWithFeedsImpl(
      currency: json['currency'] as String?,
      total: (json['total'] as num?)?.toDouble(),
      base: (json['base'] as num?)?.toDouble(),
      fees: json['fees'] == null
          ? null
          : Fees.fromJson(json['fees'] as Map<String, dynamic>),
      grandTotal: (json['grandTotal'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$PriceWithFeedsImplToJson(
        _$PriceWithFeedsImpl instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'total': instance.total,
      'base': instance.base,
      'fees': instance.fees,
      'grandTotal': instance.grandTotal,
    };
