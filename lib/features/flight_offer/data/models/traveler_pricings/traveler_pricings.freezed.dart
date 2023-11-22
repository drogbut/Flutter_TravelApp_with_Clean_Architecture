// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'traveler_pricings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TravelerPricings _$TravelerPricingsFromJson(Map<String, dynamic> json) {
  return _TravelerPricings.fromJson(json);
}

/// @nodoc
mixin _$TravelerPricings {
  String? get travelerId => throw _privateConstructorUsedError;
  String? get fareOption => throw _privateConstructorUsedError;
  String? get travelerType => throw _privateConstructorUsedError;
  Price? get price => throw _privateConstructorUsedError;
  FareDetailsBySegment? get fareDetailsBySegment =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TravelerPricingsCopyWith<TravelerPricings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TravelerPricingsCopyWith<$Res> {
  factory $TravelerPricingsCopyWith(
          TravelerPricings value, $Res Function(TravelerPricings) then) =
      _$TravelerPricingsCopyWithImpl<$Res, TravelerPricings>;
  @useResult
  $Res call(
      {String? travelerId,
      String? fareOption,
      String? travelerType,
      Price? price,
      FareDetailsBySegment? fareDetailsBySegment});

  $PriceCopyWith<$Res>? get price;
  $FareDetailsBySegmentCopyWith<$Res>? get fareDetailsBySegment;
}

/// @nodoc
class _$TravelerPricingsCopyWithImpl<$Res, $Val extends TravelerPricings>
    implements $TravelerPricingsCopyWith<$Res> {
  _$TravelerPricingsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travelerId = freezed,
    Object? fareOption = freezed,
    Object? travelerType = freezed,
    Object? price = freezed,
    Object? fareDetailsBySegment = freezed,
  }) {
    return _then(_value.copyWith(
      travelerId: freezed == travelerId
          ? _value.travelerId
          : travelerId // ignore: cast_nullable_to_non_nullable
              as String?,
      fareOption: freezed == fareOption
          ? _value.fareOption
          : fareOption // ignore: cast_nullable_to_non_nullable
              as String?,
      travelerType: freezed == travelerType
          ? _value.travelerType
          : travelerType // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price?,
      fareDetailsBySegment: freezed == fareDetailsBySegment
          ? _value.fareDetailsBySegment
          : fareDetailsBySegment // ignore: cast_nullable_to_non_nullable
              as FareDetailsBySegment?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PriceCopyWith<$Res>? get price {
    if (_value.price == null) {
      return null;
    }

    return $PriceCopyWith<$Res>(_value.price!, (value) {
      return _then(_value.copyWith(price: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $FareDetailsBySegmentCopyWith<$Res>? get fareDetailsBySegment {
    if (_value.fareDetailsBySegment == null) {
      return null;
    }

    return $FareDetailsBySegmentCopyWith<$Res>(_value.fareDetailsBySegment!,
        (value) {
      return _then(_value.copyWith(fareDetailsBySegment: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TravelerPricingsImplCopyWith<$Res>
    implements $TravelerPricingsCopyWith<$Res> {
  factory _$$TravelerPricingsImplCopyWith(_$TravelerPricingsImpl value,
          $Res Function(_$TravelerPricingsImpl) then) =
      __$$TravelerPricingsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? travelerId,
      String? fareOption,
      String? travelerType,
      Price? price,
      FareDetailsBySegment? fareDetailsBySegment});

  @override
  $PriceCopyWith<$Res>? get price;
  @override
  $FareDetailsBySegmentCopyWith<$Res>? get fareDetailsBySegment;
}

/// @nodoc
class __$$TravelerPricingsImplCopyWithImpl<$Res>
    extends _$TravelerPricingsCopyWithImpl<$Res, _$TravelerPricingsImpl>
    implements _$$TravelerPricingsImplCopyWith<$Res> {
  __$$TravelerPricingsImplCopyWithImpl(_$TravelerPricingsImpl _value,
      $Res Function(_$TravelerPricingsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? travelerId = freezed,
    Object? fareOption = freezed,
    Object? travelerType = freezed,
    Object? price = freezed,
    Object? fareDetailsBySegment = freezed,
  }) {
    return _then(_$TravelerPricingsImpl(
      travelerId: freezed == travelerId
          ? _value.travelerId
          : travelerId // ignore: cast_nullable_to_non_nullable
              as String?,
      fareOption: freezed == fareOption
          ? _value.fareOption
          : fareOption // ignore: cast_nullable_to_non_nullable
              as String?,
      travelerType: freezed == travelerType
          ? _value.travelerType
          : travelerType // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price?,
      fareDetailsBySegment: freezed == fareDetailsBySegment
          ? _value.fareDetailsBySegment
          : fareDetailsBySegment // ignore: cast_nullable_to_non_nullable
              as FareDetailsBySegment?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelerPricingsImpl implements _TravelerPricings {
  const _$TravelerPricingsImpl(
      {required this.travelerId,
      required this.fareOption,
      required this.travelerType,
      required this.price,
      required this.fareDetailsBySegment});

  factory _$TravelerPricingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelerPricingsImplFromJson(json);

  @override
  final String? travelerId;
  @override
  final String? fareOption;
  @override
  final String? travelerType;
  @override
  final Price? price;
  @override
  final FareDetailsBySegment? fareDetailsBySegment;

  @override
  String toString() {
    return 'TravelerPricings(travelerId: $travelerId, fareOption: $fareOption, travelerType: $travelerType, price: $price, fareDetailsBySegment: $fareDetailsBySegment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelerPricingsImpl &&
            (identical(other.travelerId, travelerId) ||
                other.travelerId == travelerId) &&
            (identical(other.fareOption, fareOption) ||
                other.fareOption == fareOption) &&
            (identical(other.travelerType, travelerType) ||
                other.travelerType == travelerType) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.fareDetailsBySegment, fareDetailsBySegment) ||
                other.fareDetailsBySegment == fareDetailsBySegment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, travelerId, fareOption,
      travelerType, price, fareDetailsBySegment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TravelerPricingsImplCopyWith<_$TravelerPricingsImpl> get copyWith =>
      __$$TravelerPricingsImplCopyWithImpl<_$TravelerPricingsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TravelerPricingsImplToJson(
      this,
    );
  }
}

abstract class _TravelerPricings implements TravelerPricings {
  const factory _TravelerPricings(
          {required final String? travelerId,
          required final String? fareOption,
          required final String? travelerType,
          required final Price? price,
          required final FareDetailsBySegment? fareDetailsBySegment}) =
      _$TravelerPricingsImpl;

  factory _TravelerPricings.fromJson(Map<String, dynamic> json) =
      _$TravelerPricingsImpl.fromJson;

  @override
  String? get travelerId;
  @override
  String? get fareOption;
  @override
  String? get travelerType;
  @override
  Price? get price;
  @override
  FareDetailsBySegment? get fareDetailsBySegment;
  @override
  @JsonKey(ignore: true)
  _$$TravelerPricingsImplCopyWith<_$TravelerPricingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
