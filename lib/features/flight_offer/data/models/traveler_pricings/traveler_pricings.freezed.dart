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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TravelerPricings _$TravelerPricingsFromJson(Map<String, dynamic> json) {
  return _TravelerPricings.fromJson(json);
}

/// @nodoc
mixin _$TravelerPricings {
  String? get travelerType => throw _privateConstructorUsedError;
  String? get travelerId => throw _privateConstructorUsedError;
  String? get fareOption => throw _privateConstructorUsedError;
  Price? get price => throw _privateConstructorUsedError;
  List<FareDetailsBySegment>? get fareDetailsBySegment =>
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
      {String? travelerType,
      String? travelerId,
      String? fareOption,
      Price? price,
      List<FareDetailsBySegment>? fareDetailsBySegment});

  $PriceCopyWith<$Res>? get price;
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
    Object? travelerType = freezed,
    Object? travelerId = freezed,
    Object? fareOption = freezed,
    Object? price = freezed,
    Object? fareDetailsBySegment = freezed,
  }) {
    return _then(_value.copyWith(
      travelerType: freezed == travelerType
          ? _value.travelerType
          : travelerType // ignore: cast_nullable_to_non_nullable
              as String?,
      travelerId: freezed == travelerId
          ? _value.travelerId
          : travelerId // ignore: cast_nullable_to_non_nullable
              as String?,
      fareOption: freezed == fareOption
          ? _value.fareOption
          : fareOption // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price?,
      fareDetailsBySegment: freezed == fareDetailsBySegment
          ? _value.fareDetailsBySegment
          : fareDetailsBySegment // ignore: cast_nullable_to_non_nullable
              as List<FareDetailsBySegment>?,
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
      {String? travelerType,
      String? travelerId,
      String? fareOption,
      Price? price,
      List<FareDetailsBySegment>? fareDetailsBySegment});

  @override
  $PriceCopyWith<$Res>? get price;
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
    Object? travelerType = freezed,
    Object? travelerId = freezed,
    Object? fareOption = freezed,
    Object? price = freezed,
    Object? fareDetailsBySegment = freezed,
  }) {
    return _then(_$TravelerPricingsImpl(
      travelerType: freezed == travelerType
          ? _value.travelerType
          : travelerType // ignore: cast_nullable_to_non_nullable
              as String?,
      travelerId: freezed == travelerId
          ? _value.travelerId
          : travelerId // ignore: cast_nullable_to_non_nullable
              as String?,
      fareOption: freezed == fareOption
          ? _value.fareOption
          : fareOption // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price?,
      fareDetailsBySegment: freezed == fareDetailsBySegment
          ? _value._fareDetailsBySegment
          : fareDetailsBySegment // ignore: cast_nullable_to_non_nullable
              as List<FareDetailsBySegment>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TravelerPricingsImpl implements _TravelerPricings {
  const _$TravelerPricingsImpl(
      {this.travelerType = 'ADULT',
      this.travelerId,
      this.fareOption,
      this.price,
      final List<FareDetailsBySegment>? fareDetailsBySegment})
      : _fareDetailsBySegment = fareDetailsBySegment;

  factory _$TravelerPricingsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TravelerPricingsImplFromJson(json);

  @override
  @JsonKey()
  final String? travelerType;
  @override
  final String? travelerId;
  @override
  final String? fareOption;
  @override
  final Price? price;
  final List<FareDetailsBySegment>? _fareDetailsBySegment;
  @override
  List<FareDetailsBySegment>? get fareDetailsBySegment {
    final value = _fareDetailsBySegment;
    if (value == null) return null;
    if (_fareDetailsBySegment is EqualUnmodifiableListView)
      return _fareDetailsBySegment;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'TravelerPricings(travelerType: $travelerType, travelerId: $travelerId, fareOption: $fareOption, price: $price, fareDetailsBySegment: $fareDetailsBySegment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TravelerPricingsImpl &&
            (identical(other.travelerType, travelerType) ||
                other.travelerType == travelerType) &&
            (identical(other.travelerId, travelerId) ||
                other.travelerId == travelerId) &&
            (identical(other.fareOption, fareOption) ||
                other.fareOption == fareOption) &&
            (identical(other.price, price) || other.price == price) &&
            const DeepCollectionEquality()
                .equals(other._fareDetailsBySegment, _fareDetailsBySegment));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      travelerType,
      travelerId,
      fareOption,
      price,
      const DeepCollectionEquality().hash(_fareDetailsBySegment));

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
          {final String? travelerType,
          final String? travelerId,
          final String? fareOption,
          final Price? price,
          final List<FareDetailsBySegment>? fareDetailsBySegment}) =
      _$TravelerPricingsImpl;

  factory _TravelerPricings.fromJson(Map<String, dynamic> json) =
      _$TravelerPricingsImpl.fromJson;

  @override
  String? get travelerType;
  @override
  String? get travelerId;
  @override
  String? get fareOption;
  @override
  Price? get price;
  @override
  List<FareDetailsBySegment>? get fareDetailsBySegment;
  @override
  @JsonKey(ignore: true)
  _$$TravelerPricingsImplCopyWith<_$TravelerPricingsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
