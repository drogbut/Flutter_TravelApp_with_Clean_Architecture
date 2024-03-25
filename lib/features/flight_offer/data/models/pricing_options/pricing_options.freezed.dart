// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pricing_options.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PricingOptions _$PricingOptionsFromJson(Map<String, dynamic> json) {
  return _PricingOptions.fromJson(json);
}

/// @nodoc
mixin _$PricingOptions {
  List<dynamic>? get fareType => throw _privateConstructorUsedError;
  bool? get includedCheckedBagsOnly => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PricingOptionsCopyWith<PricingOptions> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PricingOptionsCopyWith<$Res> {
  factory $PricingOptionsCopyWith(
          PricingOptions value, $Res Function(PricingOptions) then) =
      _$PricingOptionsCopyWithImpl<$Res, PricingOptions>;
  @useResult
  $Res call({List<dynamic>? fareType, bool? includedCheckedBagsOnly});
}

/// @nodoc
class _$PricingOptionsCopyWithImpl<$Res, $Val extends PricingOptions>
    implements $PricingOptionsCopyWith<$Res> {
  _$PricingOptionsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fareType = freezed,
    Object? includedCheckedBagsOnly = freezed,
  }) {
    return _then(_value.copyWith(
      fareType: freezed == fareType
          ? _value.fareType
          : fareType // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      includedCheckedBagsOnly: freezed == includedCheckedBagsOnly
          ? _value.includedCheckedBagsOnly
          : includedCheckedBagsOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PricingOptionsImplCopyWith<$Res>
    implements $PricingOptionsCopyWith<$Res> {
  factory _$$PricingOptionsImplCopyWith(_$PricingOptionsImpl value,
          $Res Function(_$PricingOptionsImpl) then) =
      __$$PricingOptionsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<dynamic>? fareType, bool? includedCheckedBagsOnly});
}

/// @nodoc
class __$$PricingOptionsImplCopyWithImpl<$Res>
    extends _$PricingOptionsCopyWithImpl<$Res, _$PricingOptionsImpl>
    implements _$$PricingOptionsImplCopyWith<$Res> {
  __$$PricingOptionsImplCopyWithImpl(
      _$PricingOptionsImpl _value, $Res Function(_$PricingOptionsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fareType = freezed,
    Object? includedCheckedBagsOnly = freezed,
  }) {
    return _then(_$PricingOptionsImpl(
      fareType: freezed == fareType
          ? _value._fareType
          : fareType // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      includedCheckedBagsOnly: freezed == includedCheckedBagsOnly
          ? _value.includedCheckedBagsOnly
          : includedCheckedBagsOnly // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PricingOptionsImpl implements _PricingOptions {
  const _$PricingOptionsImpl(
      {final List<dynamic>? fareType, this.includedCheckedBagsOnly})
      : _fareType = fareType;

  factory _$PricingOptionsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PricingOptionsImplFromJson(json);

  final List<dynamic>? _fareType;
  @override
  List<dynamic>? get fareType {
    final value = _fareType;
    if (value == null) return null;
    if (_fareType is EqualUnmodifiableListView) return _fareType;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? includedCheckedBagsOnly;

  @override
  String toString() {
    return 'PricingOptions(fareType: $fareType, includedCheckedBagsOnly: $includedCheckedBagsOnly)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PricingOptionsImpl &&
            const DeepCollectionEquality().equals(other._fareType, _fareType) &&
            (identical(
                    other.includedCheckedBagsOnly, includedCheckedBagsOnly) ||
                other.includedCheckedBagsOnly == includedCheckedBagsOnly));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_fareType), includedCheckedBagsOnly);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PricingOptionsImplCopyWith<_$PricingOptionsImpl> get copyWith =>
      __$$PricingOptionsImplCopyWithImpl<_$PricingOptionsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PricingOptionsImplToJson(
      this,
    );
  }
}

abstract class _PricingOptions implements PricingOptions {
  const factory _PricingOptions(
      {final List<dynamic>? fareType,
      final bool? includedCheckedBagsOnly}) = _$PricingOptionsImpl;

  factory _PricingOptions.fromJson(Map<String, dynamic> json) =
      _$PricingOptionsImpl.fromJson;

  @override
  List<dynamic>? get fareType;
  @override
  bool? get includedCheckedBagsOnly;
  @override
  @JsonKey(ignore: true)
  _$$PricingOptionsImplCopyWith<_$PricingOptionsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
