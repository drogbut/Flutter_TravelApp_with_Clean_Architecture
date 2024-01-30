// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'operating.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Operating _$OperatingFromJson(Map<String, dynamic> json) {
  return _Operating.fromJson(json);
}

/// @nodoc
mixin _$Operating {
  String? get carrierCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OperatingCopyWith<Operating> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OperatingCopyWith<$Res> {
  factory $OperatingCopyWith(Operating value, $Res Function(Operating) then) =
      _$OperatingCopyWithImpl<$Res, Operating>;
  @useResult
  $Res call({String? carrierCode});
}

/// @nodoc
class _$OperatingCopyWithImpl<$Res, $Val extends Operating>
    implements $OperatingCopyWith<$Res> {
  _$OperatingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carrierCode = freezed,
  }) {
    return _then(_value.copyWith(
      carrierCode: freezed == carrierCode
          ? _value.carrierCode
          : carrierCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OperatingImplCopyWith<$Res>
    implements $OperatingCopyWith<$Res> {
  factory _$$OperatingImplCopyWith(
          _$OperatingImpl value, $Res Function(_$OperatingImpl) then) =
      __$$OperatingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? carrierCode});
}

/// @nodoc
class __$$OperatingImplCopyWithImpl<$Res>
    extends _$OperatingCopyWithImpl<$Res, _$OperatingImpl>
    implements _$$OperatingImplCopyWith<$Res> {
  __$$OperatingImplCopyWithImpl(
      _$OperatingImpl _value, $Res Function(_$OperatingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? carrierCode = freezed,
  }) {
    return _then(_$OperatingImpl(
      carrierCode: freezed == carrierCode
          ? _value.carrierCode
          : carrierCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OperatingImpl implements _Operating {
  const _$OperatingImpl({this.carrierCode});

  factory _$OperatingImpl.fromJson(Map<String, dynamic> json) =>
      _$$OperatingImplFromJson(json);

  @override
  final String? carrierCode;

  @override
  String toString() {
    return 'Operating(carrierCode: $carrierCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OperatingImpl &&
            (identical(other.carrierCode, carrierCode) ||
                other.carrierCode == carrierCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, carrierCode);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OperatingImplCopyWith<_$OperatingImpl> get copyWith =>
      __$$OperatingImplCopyWithImpl<_$OperatingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OperatingImplToJson(
      this,
    );
  }
}

abstract class _Operating implements Operating {
  const factory _Operating({final String? carrierCode}) = _$OperatingImpl;

  factory _Operating.fromJson(Map<String, dynamic> json) =
      _$OperatingImpl.fromJson;

  @override
  String? get carrierCode;
  @override
  @JsonKey(ignore: true)
  _$$OperatingImplCopyWith<_$OperatingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
