// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_with_fees.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PriceWithFeesImpl _$$PriceWithFeesImplFromJson(Map<String, dynamic> json) =>
    _$PriceWithFeesImpl(
      currency: json['currency'] as String?,
      total: json['total'] as String?,
      base: json['base'] as String?,
      fees: (json['fees'] as List<dynamic>?)
          ?.map((e) => Fees.fromJson(e as Map<String, dynamic>))
          .toList(),
      grandTotal: json['grandTotal'] as String?,
    );

Map<String, dynamic> _$$PriceWithFeesImplToJson(_$PriceWithFeesImpl instance) =>
    <String, dynamic>{
      'currency': instance.currency,
      'total': instance.total,
      'base': instance.base,
      'fees': instance.fees,
      'grandTotal': instance.grandTotal,
    };
