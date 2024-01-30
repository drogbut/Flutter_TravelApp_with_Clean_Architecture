// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aircraft.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Aircraft _$AircraftFromJson(Map<String, dynamic> json) {
  return _Aircraft.fromJson(json);
}

/// @nodoc
mixin _$Aircraft {
  String? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AircraftCopyWith<Aircraft> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AircraftCopyWith<$Res> {
  factory $AircraftCopyWith(Aircraft value, $Res Function(Aircraft) then) =
      _$AircraftCopyWithImpl<$Res, Aircraft>;
  @useResult
  $Res call({String? code});
}

/// @nodoc
class _$AircraftCopyWithImpl<$Res, $Val extends Aircraft>
    implements $AircraftCopyWith<$Res> {
  _$AircraftCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AircraftImplCopyWith<$Res>
    implements $AircraftCopyWith<$Res> {
  factory _$$AircraftImplCopyWith(
          _$AircraftImpl value, $Res Function(_$AircraftImpl) then) =
      __$$AircraftImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? code});
}

/// @nodoc
class __$$AircraftImplCopyWithImpl<$Res>
    extends _$AircraftCopyWithImpl<$Res, _$AircraftImpl>
    implements _$$AircraftImplCopyWith<$Res> {
  __$$AircraftImplCopyWithImpl(
      _$AircraftImpl _value, $Res Function(_$AircraftImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? code = freezed,
  }) {
    return _then(_$AircraftImpl(
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AircraftImpl implements _Aircraft {
  const _$AircraftImpl({required this.code});

  factory _$AircraftImpl.fromJson(Map<String, dynamic> json) =>
      _$$AircraftImplFromJson(json);

  @override
  final String? code;

  @override
  String toString() {
    return 'Aircraft(code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AircraftImpl &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AircraftImplCopyWith<_$AircraftImpl> get copyWith =>
      __$$AircraftImplCopyWithImpl<_$AircraftImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AircraftImplToJson(
      this,
    );
  }
}

abstract class _Aircraft implements Aircraft {
  const factory _Aircraft({required final String? code}) = _$AircraftImpl;

  factory _Aircraft.fromJson(Map<String, dynamic> json) =
      _$AircraftImpl.fromJson;

  @override
  String? get code;
  @override
  @JsonKey(ignore: true)
  _$$AircraftImplCopyWith<_$AircraftImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
