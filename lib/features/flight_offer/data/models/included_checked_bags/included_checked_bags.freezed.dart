// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'included_checked_bags.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

IncludedCheckedBags _$IncludedCheckedBagsFromJson(Map<String, dynamic> json) {
  return _IncludedCheckedBags.fromJson(json);
}

/// @nodoc
mixin _$IncludedCheckedBags {
  int? get weight => throw _privateConstructorUsedError;
  int? get weightUnit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IncludedCheckedBagsCopyWith<IncludedCheckedBags> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IncludedCheckedBagsCopyWith<$Res> {
  factory $IncludedCheckedBagsCopyWith(
          IncludedCheckedBags value, $Res Function(IncludedCheckedBags) then) =
      _$IncludedCheckedBagsCopyWithImpl<$Res, IncludedCheckedBags>;
  @useResult
  $Res call({int? weight, int? weightUnit});
}

/// @nodoc
class _$IncludedCheckedBagsCopyWithImpl<$Res, $Val extends IncludedCheckedBags>
    implements $IncludedCheckedBagsCopyWith<$Res> {
  _$IncludedCheckedBagsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weight = freezed,
    Object? weightUnit = freezed,
  }) {
    return _then(_value.copyWith(
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      weightUnit: freezed == weightUnit
          ? _value.weightUnit
          : weightUnit // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$IncludedCheckedBagsImplCopyWith<$Res>
    implements $IncludedCheckedBagsCopyWith<$Res> {
  factory _$$IncludedCheckedBagsImplCopyWith(_$IncludedCheckedBagsImpl value,
          $Res Function(_$IncludedCheckedBagsImpl) then) =
      __$$IncludedCheckedBagsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? weight, int? weightUnit});
}

/// @nodoc
class __$$IncludedCheckedBagsImplCopyWithImpl<$Res>
    extends _$IncludedCheckedBagsCopyWithImpl<$Res, _$IncludedCheckedBagsImpl>
    implements _$$IncludedCheckedBagsImplCopyWith<$Res> {
  __$$IncludedCheckedBagsImplCopyWithImpl(_$IncludedCheckedBagsImpl _value,
      $Res Function(_$IncludedCheckedBagsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? weight = freezed,
    Object? weightUnit = freezed,
  }) {
    return _then(_$IncludedCheckedBagsImpl(
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as int?,
      weightUnit: freezed == weightUnit
          ? _value.weightUnit
          : weightUnit // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$IncludedCheckedBagsImpl implements _IncludedCheckedBags {
  const _$IncludedCheckedBagsImpl(
      {required this.weight, required this.weightUnit});

  factory _$IncludedCheckedBagsImpl.fromJson(Map<String, dynamic> json) =>
      _$$IncludedCheckedBagsImplFromJson(json);

  @override
  final int? weight;
  @override
  final int? weightUnit;

  @override
  String toString() {
    return 'IncludedCheckedBags(weight: $weight, weightUnit: $weightUnit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncludedCheckedBagsImpl &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.weightUnit, weightUnit) ||
                other.weightUnit == weightUnit));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, weight, weightUnit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncludedCheckedBagsImplCopyWith<_$IncludedCheckedBagsImpl> get copyWith =>
      __$$IncludedCheckedBagsImplCopyWithImpl<_$IncludedCheckedBagsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$IncludedCheckedBagsImplToJson(
      this,
    );
  }
}

abstract class _IncludedCheckedBags implements IncludedCheckedBags {
  const factory _IncludedCheckedBags(
      {required final int? weight,
      required final int? weightUnit}) = _$IncludedCheckedBagsImpl;

  factory _IncludedCheckedBags.fromJson(Map<String, dynamic> json) =
      _$IncludedCheckedBagsImpl.fromJson;

  @override
  int? get weight;
  @override
  int? get weightUnit;
  @override
  @JsonKey(ignore: true)
  _$$IncludedCheckedBagsImplCopyWith<_$IncludedCheckedBagsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
