// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'flight_offer.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlightOffer _$FlightOfferFromJson(Map<String, dynamic> json) {
  return _FlightOffer.fromJson(json);
}

/// @nodoc
mixin _$FlightOffer {
  String? get type => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  String? get source => throw _privateConstructorUsedError;
  bool? get instantTicketingRequired => throw _privateConstructorUsedError;
  bool? get nonHomogeneous => throw _privateConstructorUsedError;
  bool? get oneWay => throw _privateConstructorUsedError;
  String? get lastTicketingDate => throw _privateConstructorUsedError;
  String? get lastTicketingDateTime => throw _privateConstructorUsedError;
  int? get numberOfBookableSeats => throw _privateConstructorUsedError;
  List<Itineraries>? get itineraries => throw _privateConstructorUsedError;
  Price? get price => throw _privateConstructorUsedError;
  PricingOptions? get pricingOptions => throw _privateConstructorUsedError;
  List<String?>? get validatingAirlineCodes =>
      throw _privateConstructorUsedError;
  List<TravelerPricings>? get travelerPricings =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlightOfferCopyWith<FlightOffer> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlightOfferCopyWith<$Res> {
  factory $FlightOfferCopyWith(
          FlightOffer value, $Res Function(FlightOffer) then) =
      _$FlightOfferCopyWithImpl<$Res, FlightOffer>;
  @useResult
  $Res call(
      {String? type,
      String? id,
      String? source,
      bool? instantTicketingRequired,
      bool? nonHomogeneous,
      bool? oneWay,
      String? lastTicketingDate,
      String? lastTicketingDateTime,
      int? numberOfBookableSeats,
      List<Itineraries>? itineraries,
      Price? price,
      PricingOptions? pricingOptions,
      List<String?>? validatingAirlineCodes,
      List<TravelerPricings>? travelerPricings});

  $PriceCopyWith<$Res>? get price;
  $PricingOptionsCopyWith<$Res>? get pricingOptions;
}

/// @nodoc
class _$FlightOfferCopyWithImpl<$Res, $Val extends FlightOffer>
    implements $FlightOfferCopyWith<$Res> {
  _$FlightOfferCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? id = freezed,
    Object? source = freezed,
    Object? instantTicketingRequired = freezed,
    Object? nonHomogeneous = freezed,
    Object? oneWay = freezed,
    Object? lastTicketingDate = freezed,
    Object? lastTicketingDateTime = freezed,
    Object? numberOfBookableSeats = freezed,
    Object? itineraries = freezed,
    Object? price = freezed,
    Object? pricingOptions = freezed,
    Object? validatingAirlineCodes = freezed,
    Object? travelerPricings = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      instantTicketingRequired: freezed == instantTicketingRequired
          ? _value.instantTicketingRequired
          : instantTicketingRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      nonHomogeneous: freezed == nonHomogeneous
          ? _value.nonHomogeneous
          : nonHomogeneous // ignore: cast_nullable_to_non_nullable
              as bool?,
      oneWay: freezed == oneWay
          ? _value.oneWay
          : oneWay // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastTicketingDate: freezed == lastTicketingDate
          ? _value.lastTicketingDate
          : lastTicketingDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastTicketingDateTime: freezed == lastTicketingDateTime
          ? _value.lastTicketingDateTime
          : lastTicketingDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfBookableSeats: freezed == numberOfBookableSeats
          ? _value.numberOfBookableSeats
          : numberOfBookableSeats // ignore: cast_nullable_to_non_nullable
              as int?,
      itineraries: freezed == itineraries
          ? _value.itineraries
          : itineraries // ignore: cast_nullable_to_non_nullable
              as List<Itineraries>?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price?,
      pricingOptions: freezed == pricingOptions
          ? _value.pricingOptions
          : pricingOptions // ignore: cast_nullable_to_non_nullable
              as PricingOptions?,
      validatingAirlineCodes: freezed == validatingAirlineCodes
          ? _value.validatingAirlineCodes
          : validatingAirlineCodes // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      travelerPricings: freezed == travelerPricings
          ? _value.travelerPricings
          : travelerPricings // ignore: cast_nullable_to_non_nullable
              as List<TravelerPricings>?,
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
  $PricingOptionsCopyWith<$Res>? get pricingOptions {
    if (_value.pricingOptions == null) {
      return null;
    }

    return $PricingOptionsCopyWith<$Res>(_value.pricingOptions!, (value) {
      return _then(_value.copyWith(pricingOptions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FlightOfferImplCopyWith<$Res>
    implements $FlightOfferCopyWith<$Res> {
  factory _$$FlightOfferImplCopyWith(
          _$FlightOfferImpl value, $Res Function(_$FlightOfferImpl) then) =
      __$$FlightOfferImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? type,
      String? id,
      String? source,
      bool? instantTicketingRequired,
      bool? nonHomogeneous,
      bool? oneWay,
      String? lastTicketingDate,
      String? lastTicketingDateTime,
      int? numberOfBookableSeats,
      List<Itineraries>? itineraries,
      Price? price,
      PricingOptions? pricingOptions,
      List<String?>? validatingAirlineCodes,
      List<TravelerPricings>? travelerPricings});

  @override
  $PriceCopyWith<$Res>? get price;
  @override
  $PricingOptionsCopyWith<$Res>? get pricingOptions;
}

/// @nodoc
class __$$FlightOfferImplCopyWithImpl<$Res>
    extends _$FlightOfferCopyWithImpl<$Res, _$FlightOfferImpl>
    implements _$$FlightOfferImplCopyWith<$Res> {
  __$$FlightOfferImplCopyWithImpl(
      _$FlightOfferImpl _value, $Res Function(_$FlightOfferImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? id = freezed,
    Object? source = freezed,
    Object? instantTicketingRequired = freezed,
    Object? nonHomogeneous = freezed,
    Object? oneWay = freezed,
    Object? lastTicketingDate = freezed,
    Object? lastTicketingDateTime = freezed,
    Object? numberOfBookableSeats = freezed,
    Object? itineraries = freezed,
    Object? price = freezed,
    Object? pricingOptions = freezed,
    Object? validatingAirlineCodes = freezed,
    Object? travelerPricings = freezed,
  }) {
    return _then(_$FlightOfferImpl(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      source: freezed == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String?,
      instantTicketingRequired: freezed == instantTicketingRequired
          ? _value.instantTicketingRequired
          : instantTicketingRequired // ignore: cast_nullable_to_non_nullable
              as bool?,
      nonHomogeneous: freezed == nonHomogeneous
          ? _value.nonHomogeneous
          : nonHomogeneous // ignore: cast_nullable_to_non_nullable
              as bool?,
      oneWay: freezed == oneWay
          ? _value.oneWay
          : oneWay // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastTicketingDate: freezed == lastTicketingDate
          ? _value.lastTicketingDate
          : lastTicketingDate // ignore: cast_nullable_to_non_nullable
              as String?,
      lastTicketingDateTime: freezed == lastTicketingDateTime
          ? _value.lastTicketingDateTime
          : lastTicketingDateTime // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfBookableSeats: freezed == numberOfBookableSeats
          ? _value.numberOfBookableSeats
          : numberOfBookableSeats // ignore: cast_nullable_to_non_nullable
              as int?,
      itineraries: freezed == itineraries
          ? _value._itineraries
          : itineraries // ignore: cast_nullable_to_non_nullable
              as List<Itineraries>?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as Price?,
      pricingOptions: freezed == pricingOptions
          ? _value.pricingOptions
          : pricingOptions // ignore: cast_nullable_to_non_nullable
              as PricingOptions?,
      validatingAirlineCodes: freezed == validatingAirlineCodes
          ? _value._validatingAirlineCodes
          : validatingAirlineCodes // ignore: cast_nullable_to_non_nullable
              as List<String?>?,
      travelerPricings: freezed == travelerPricings
          ? _value._travelerPricings
          : travelerPricings // ignore: cast_nullable_to_non_nullable
              as List<TravelerPricings>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FlightOfferImpl implements _FlightOffer {
  const _$FlightOfferImpl(
      {this.type,
      this.id,
      this.source,
      this.instantTicketingRequired,
      this.nonHomogeneous,
      this.oneWay,
      this.lastTicketingDate,
      this.lastTicketingDateTime,
      this.numberOfBookableSeats,
      final List<Itineraries>? itineraries,
      this.price,
      this.pricingOptions,
      final List<String?>? validatingAirlineCodes,
      final List<TravelerPricings>? travelerPricings})
      : _itineraries = itineraries,
        _validatingAirlineCodes = validatingAirlineCodes,
        _travelerPricings = travelerPricings;

  factory _$FlightOfferImpl.fromJson(Map<String, dynamic> json) =>
      _$$FlightOfferImplFromJson(json);

  @override
  final String? type;
  @override
  final String? id;
  @override
  final String? source;
  @override
  final bool? instantTicketingRequired;
  @override
  final bool? nonHomogeneous;
  @override
  final bool? oneWay;
  @override
  final String? lastTicketingDate;
  @override
  final String? lastTicketingDateTime;
  @override
  final int? numberOfBookableSeats;
  final List<Itineraries>? _itineraries;
  @override
  List<Itineraries>? get itineraries {
    final value = _itineraries;
    if (value == null) return null;
    if (_itineraries is EqualUnmodifiableListView) return _itineraries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final Price? price;
  @override
  final PricingOptions? pricingOptions;
  final List<String?>? _validatingAirlineCodes;
  @override
  List<String?>? get validatingAirlineCodes {
    final value = _validatingAirlineCodes;
    if (value == null) return null;
    if (_validatingAirlineCodes is EqualUnmodifiableListView)
      return _validatingAirlineCodes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<TravelerPricings>? _travelerPricings;
  @override
  List<TravelerPricings>? get travelerPricings {
    final value = _travelerPricings;
    if (value == null) return null;
    if (_travelerPricings is EqualUnmodifiableListView)
      return _travelerPricings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'FlightOffer(type: $type, id: $id, source: $source, instantTicketingRequired: $instantTicketingRequired, nonHomogeneous: $nonHomogeneous, oneWay: $oneWay, lastTicketingDate: $lastTicketingDate, lastTicketingDateTime: $lastTicketingDateTime, numberOfBookableSeats: $numberOfBookableSeats, itineraries: $itineraries, price: $price, pricingOptions: $pricingOptions, validatingAirlineCodes: $validatingAirlineCodes, travelerPricings: $travelerPricings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FlightOfferImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(
                    other.instantTicketingRequired, instantTicketingRequired) ||
                other.instantTicketingRequired == instantTicketingRequired) &&
            (identical(other.nonHomogeneous, nonHomogeneous) ||
                other.nonHomogeneous == nonHomogeneous) &&
            (identical(other.oneWay, oneWay) || other.oneWay == oneWay) &&
            (identical(other.lastTicketingDate, lastTicketingDate) ||
                other.lastTicketingDate == lastTicketingDate) &&
            (identical(other.lastTicketingDateTime, lastTicketingDateTime) ||
                other.lastTicketingDateTime == lastTicketingDateTime) &&
            (identical(other.numberOfBookableSeats, numberOfBookableSeats) ||
                other.numberOfBookableSeats == numberOfBookableSeats) &&
            const DeepCollectionEquality()
                .equals(other._itineraries, _itineraries) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.pricingOptions, pricingOptions) ||
                other.pricingOptions == pricingOptions) &&
            const DeepCollectionEquality().equals(
                other._validatingAirlineCodes, _validatingAirlineCodes) &&
            const DeepCollectionEquality()
                .equals(other._travelerPricings, _travelerPricings));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      id,
      source,
      instantTicketingRequired,
      nonHomogeneous,
      oneWay,
      lastTicketingDate,
      lastTicketingDateTime,
      numberOfBookableSeats,
      const DeepCollectionEquality().hash(_itineraries),
      price,
      pricingOptions,
      const DeepCollectionEquality().hash(_validatingAirlineCodes),
      const DeepCollectionEquality().hash(_travelerPricings));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FlightOfferImplCopyWith<_$FlightOfferImpl> get copyWith =>
      __$$FlightOfferImplCopyWithImpl<_$FlightOfferImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FlightOfferImplToJson(
      this,
    );
  }
}

abstract class _FlightOffer implements FlightOffer {
  const factory _FlightOffer(
      {final String? type,
      final String? id,
      final String? source,
      final bool? instantTicketingRequired,
      final bool? nonHomogeneous,
      final bool? oneWay,
      final String? lastTicketingDate,
      final String? lastTicketingDateTime,
      final int? numberOfBookableSeats,
      final List<Itineraries>? itineraries,
      final Price? price,
      final PricingOptions? pricingOptions,
      final List<String?>? validatingAirlineCodes,
      final List<TravelerPricings>? travelerPricings}) = _$FlightOfferImpl;

  factory _FlightOffer.fromJson(Map<String, dynamic> json) =
      _$FlightOfferImpl.fromJson;

  @override
  String? get type;
  @override
  String? get id;
  @override
  String? get source;
  @override
  bool? get instantTicketingRequired;
  @override
  bool? get nonHomogeneous;
  @override
  bool? get oneWay;
  @override
  String? get lastTicketingDate;
  @override
  String? get lastTicketingDateTime;
  @override
  int? get numberOfBookableSeats;
  @override
  List<Itineraries>? get itineraries;
  @override
  Price? get price;
  @override
  PricingOptions? get pricingOptions;
  @override
  List<String?>? get validatingAirlineCodes;
  @override
  List<TravelerPricings>? get travelerPricings;
  @override
  @JsonKey(ignore: true)
  _$$FlightOfferImplCopyWith<_$FlightOfferImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
