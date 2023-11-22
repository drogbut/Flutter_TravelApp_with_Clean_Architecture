// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pricing_options.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PricingOptionsImpl _$$PricingOptionsImplFromJson(Map<String, dynamic> json) =>
    _$PricingOptionsImpl(
      fareType: json['fareType'] as String?,
      includedCheckedBagsOnly: json['includedCheckedBagsOnly'] as bool?,
    );

Map<String, dynamic> _$$PricingOptionsImplToJson(
        _$PricingOptionsImpl instance) =>
    <String, dynamic>{
      'fareType': instance.fareType,
      'includedCheckedBagsOnly': instance.includedCheckedBagsOnly,
    };
