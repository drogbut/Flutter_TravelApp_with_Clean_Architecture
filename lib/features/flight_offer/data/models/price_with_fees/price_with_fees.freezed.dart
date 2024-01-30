// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'price_with_fees.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PriceWithFees _$PriceWithFeesFromJson(Map<String, dynamic> json) {
  return _PriceWithFees.fromJson(json);
}

/// @nodoc
mixin _$PriceWithFees {
  String? get currency => throw _privateConstructorUsedError;
  String? get total => throw _privateConstructorUsedError;
  String? get base => throw _privateConstructorUsedError;
  List<Fees>? get fees => throw _privateConstructorUsedError;
  String? get grandTotal => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PriceWithFeesCopyWith<PriceWithFees> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceWithFeesCopyWith<$Res> {
  factory $PriceWithFeesCopyWith(
          PriceWithFees value, $Res Function(PriceWithFees) then) =
      _$PriceWithFeesCopyWithImpl<$Res, PriceWithFees>;
  @useResult
  $Res call(
      {String? currency,
      String? total,
      String? base,
      List<Fees>? fees,
      String? grandTotal});
}

/// @nodoc
class _$PriceWithFeesCopyWithImpl<$Res, $Val extends PriceWithFees>
    implements $PriceWithFeesCopyWith<$Res> {
  _$PriceWithFeesCopyWithImpl(this._value, this._then);

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
              as String?,
      base: freezed == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as String?,
      fees: freezed == fees
          ? _value.fees
          : fees // ignore: cast_nullable_to_non_nullable
              as List<Fees>?,
      grandTotal: freezed == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceWithFeesImplCopyWith<$Res>
    implements $PriceWithFeesCopyWith<$Res> {
  factory _$$PriceWithFeesImplCopyWith(
          _$PriceWithFeesImpl value, $Res Function(_$PriceWithFeesImpl) then) =
      __$$PriceWithFeesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? currency,
      String? total,
      String? base,
      List<Fees>? fees,
      String? grandTotal});
}

/// @nodoc
class __$$PriceWithFeesImplCopyWithImpl<$Res>
    extends _$PriceWithFeesCopyWithImpl<$Res, _$PriceWithFeesImpl>
    implements _$$PriceWithFeesImplCopyWith<$Res> {
  __$$PriceWithFeesImplCopyWithImpl(
      _$PriceWithFeesImpl _value, $Res Function(_$PriceWithFeesImpl) _then)
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
    return _then(_$PriceWithFeesImpl(
      currency: freezed == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String?,
      total: freezed == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as String?,
      base: freezed == base
          ? _value.base
          : base // ignore: cast_nullable_to_non_nullable
              as String?,
      fees: freezed == fees
          ? _value._fees
          : fees // ignore: cast_nullable_to_non_nullable
              as List<Fees>?,
      grandTotal: freezed == grandTotal
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceWithFeesImpl implements _PriceWithFees {
  const _$PriceWithFeesImpl(
      {this.currency,
      this.total,
      this.base,
      final List<Fees>? fees,
      this.grandTotal})
      : _fees = fees;

  factory _$PriceWithFeesImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceWithFeesImplFromJson(json);

  @override
  final String? currency;
  @override
  final String? total;
  @override
  final String? base;
  final List<Fees>? _fees;
  @override
  List<Fees>? get fees {
    final value = _fees;
    if (value == null) return null;
    if (_fees is EqualUnmodifiableListView) return _fees;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? grandTotal;

  @override
  String toString() {
    return 'PriceWithFees(currency: $currency, total: $total, base: $base, fees: $fees, grandTotal: $grandTotal)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceWithFeesImpl &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.base, base) || other.base == base) &&
            const DeepCollectionEquality().equals(other._fees, _fees) &&
            (identical(other.grandTotal, grandTotal) ||
                other.grandTotal == grandTotal));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, currency, total, base,
      const DeepCollectionEquality().hash(_fees), grandTotal);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceWithFeesImplCopyWith<_$PriceWithFeesImpl> get copyWith =>
      __$$PriceWithFeesImplCopyWithImpl<_$PriceWithFeesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceWithFeesImplToJson(
      this,
    );
  }
}

abstract class _PriceWithFees implements PriceWithFees {
  const factory _PriceWithFees(
      {final String? currency,
      final String? total,
      final String? base,
      final List<Fees>? fees,
      final String? grandTotal}) = _$PriceWithFeesImpl;

  factory _PriceWithFees.fromJson(Map<String, dynamic> json) =
      _$PriceWithFeesImpl.fromJson;

  @override
  String? get currency;
  @override
  String? get total;
  @override
  String? get base;
  @override
  List<Fees>? get fees;
  @override
  String? get grandTotal;
  @override
  @JsonKey(ignore: true)
  _$$PriceWithFeesImplCopyWith<_$PriceWithFeesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
