// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_with_feeds.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PriceWithFeeds _$PriceWithFeedsFromJson(Map<String, dynamic> json) {
  return _PriceWithFeeds.fromJson(json);
}

/// @nodoc
mixin _$PriceWithFeeds {
  String? get currency => throw _privateConstructorUsedError;
  double? get total => throw _privateConstructorUsedError;
  double? get base => throw _privateConstructorUsedError;
  Fees? get fees => throw _privateConstructorUsedError;
  double? get grandTotal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceWithFeedsCopyWith<PriceWithFeeds> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceWithFeedsCopyWith<$Res> {
  factory $PriceWithFeedsCopyWith(
          PriceWithFeeds value, $Res Function(PriceWithFeeds) then) =
      _$PriceWithFeedsCopyWithImpl<$Res, PriceWithFeeds>;
  @useResult
  $Res call(
      {String? currency,
      double? total,
      double? base,
      Fees? fees,
      double? grandTotal});

  $FeesCopyWith<$Res>? get fees;
}

/// @nodoc
class _$PriceWithFeedsCopyWithImpl<$Res, $Val extends PriceWithFeeds>
    implements $PriceWithFeedsCopyWith<$Res> {
  _$PriceWithFeedsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = freezed,
    Object? total = freezed,
    Object? base = freezed,
    Object? fees = freezed,
    Object? grandTotal = freezed,
  }) {
    return _then(_value.copyWith(
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      base: freezed == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as double?,
      fees: freezed == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as Fees?,
      grandTotal: freezed == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FeesCopyWith<$Res>? get fees {
    if (_value.fees == null) {
      return null;
    }

    return $FeesCopyWith<$Res>(_value.fees!, (value) {
      return _then(_value.copyWith(fees: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PriceWithFeedsImplCopyWith<$Res>
    implements $PriceWithFeedsCopyWith<$Res> {
  factory _$$PriceWithFeedsImplCopyWith(_$PriceWithFeedsImpl value,
          $Res Function(_$PriceWithFeedsImpl) then) =
      __$$PriceWithFeedsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? currency,
      double? total,
      double? base,
      Fees? fees,
      double? grandTotal});

  @override
  $FeesCopyWith<$Res>? get fees;
}

/// @nodoc
class __$$PriceWithFeedsImplCopyWithImpl<$Res>
    extends _$PriceWithFeedsCopyWithImpl<$Res, _$PriceWithFeedsImpl>
    implements _$$PriceWithFeedsImplCopyWith<$Res> {
  __$$PriceWithFeedsImplCopyWithImpl(
      _$PriceWithFeedsImpl _value, $Res Function(_$PriceWithFeedsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currency = freezed,
    Object? total = freezed,
    Object? base = freezed,
    Object? fees = freezed,
    Object? grandTotal = freezed,
  }) {
    return _then(_$PriceWithFeedsImpl(
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double?,
      base: freezed == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as double?,
      fees: freezed == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as Fees?,
      grandTotal: freezed == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceWithFeedsImpl implements _PriceWithFeeds {
  const _$PriceWithFeedsImpl(
      {required this.currency,
      required this.total,
      required this.base,
      required this.fees,
      required this.grandTotal});

  factory _$PriceWithFeedsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceWithFeedsImplFromJson(json);

  @override
  final String? currency;
  @override
  final double? total;
  @override
  final double? base;
  @override
  final Fees? fees;
  @override
  final double? grandTotal;

  @override
  String toString() {
    return 'PriceWithFeeds(currency: $currency, total: $total, base: $base, fees: $fees, grandTotal: $grandTotal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceWithFeedsImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.base, base) || other.base == base) &&
            (identical(other.fees, fees) || other.fees == fees) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, currency, total, base, fees, grandTotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceWithFeedsImplCopyWith<_$PriceWithFeedsImpl> get copyWith =>
      __$$PriceWithFeedsImplCopyWithImpl<_$PriceWithFeedsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceWithFeedsImplToJson(
      this,
    );
  }
}

abstract class _PriceWithFeeds implements PriceWithFeeds {
  const factory _PriceWithFeeds(
      {required final String? currency,
      required final double? total,
      required final double? base,
      required final Fees? fees,
      required final double? grandTotal}) = _$PriceWithFeedsImpl;

  factory _PriceWithFeeds.fromJson(Map<String, dynamic> json) =
      _$PriceWithFeedsImpl.fromJson;

  @override
  String? get currency;
  @override
  double? get total;
  @override
  double? get base;
  @override
  Fees? get fees;
  @override
  double? get grandTotal;
  @override
  @JsonKey(ignore: true)
  _$$PriceWithFeedsImplCopyWith<_$PriceWithFeedsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
