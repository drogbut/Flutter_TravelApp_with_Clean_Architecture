// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'arrival.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Arrival _$ArrivalFromJson(Map<String, dynamic> json) {
  return _Arrival.fromJson(json);
}

/// @nodoc
mixin _$Arrival {
  String? get iataCode => throw _privateConstructorUsedError;
  String? get terminal => throw _privateConstructorUsedError;
  String? get at => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ArrivalCopyWith<Arrival> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArrivalCopyWith<$Res> {
  factory $ArrivalCopyWith(Arrival value, $Res Function(Arrival) then) =
      _$ArrivalCopyWithImpl<$Res, Arrival>;
  @useResult
  $Res call({String? iataCode, String? terminal, String? at});
}

/// @nodoc
class _$ArrivalCopyWithImpl<$Res, $Val extends Arrival>
    implements $ArrivalCopyWith<$Res> {
  _$ArrivalCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iataCode = freezed,
    Object? terminal = freezed,
    Object? at = freezed,
  }) {
    return _then(_value.copyWith(
      iataCode: freezed == iataCode
          ? _value.iataCode
          : iataCode // ignore: cast_nullable_to_non_nullable
              as String?,
      terminal: freezed == terminal
          ? _value.terminal
          : terminal // ignore: cast_nullable_to_non_nullable
              as String?,
      at: freezed == at
          ? _value.at
          : at // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ArrivalImplCopyWith<$Res> implements $ArrivalCopyWith<$Res> {
  factory _$$ArrivalImplCopyWith(
          _$ArrivalImpl value, $Res Function(_$ArrivalImpl) then) =
      __$$ArrivalImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? iataCode, String? terminal, String? at});
}

/// @nodoc
class __$$ArrivalImplCopyWithImpl<$Res>
    extends _$ArrivalCopyWithImpl<$Res, _$ArrivalImpl>
    implements _$$ArrivalImplCopyWith<$Res> {
  __$$ArrivalImplCopyWithImpl(
      _$ArrivalImpl _value, $Res Function(_$ArrivalImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iataCode = freezed,
    Object? terminal = freezed,
    Object? at = freezed,
  }) {
    return _then(_$ArrivalImpl(
      iataCode: freezed == iataCode
          ? _value.iataCode
          : iataCode // ignore: cast_nullable_to_non_nullable
              as String?,
      terminal: freezed == terminal
          ? _value.terminal
          : terminal // ignore: cast_nullable_to_non_nullable
              as String?,
      at: freezed == at
          ? _value.at
          : at // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ArrivalImpl implements _Arrival {
  const _$ArrivalImpl(
      {required this.iataCode, required this.terminal, required this.at});

  factory _$ArrivalImpl.fromJson(Map<String, dynamic> json) =>
      _$$ArrivalImplFromJson(json);

  @override
  final String? iataCode;
  @override
  final String? terminal;
  @override
  final String? at;

  @override
  String toString() {
    return 'Arrival(iataCode: $iataCode, terminal: $terminal, at: $at)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ArrivalImpl &&
            (identical(other.iataCode, iataCode) ||
                other.iataCode == iataCode) &&
            (identical(other.terminal, terminal) ||
                other.terminal == terminal) &&
            (identical(other.at, at) || other.at == at));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, iataCode, terminal, at);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ArrivalImplCopyWith<_$ArrivalImpl> get copyWith =>
      __$$ArrivalImplCopyWithImpl<_$ArrivalImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ArrivalImplToJson(
      this,
    );
  }
}

abstract class _Arrival implements Arrival {
  const factory _Arrival(
      {required final String? iataCode,
      required final String? terminal,
      required final String? at}) = _$ArrivalImpl;

  factory _Arrival.fromJson(Map<String, dynamic> json) = _$ArrivalImpl.fromJson;

  @override
  String? get iataCode;
  @override
  String? get terminal;
  @override
  String? get at;
  @override
  @JsonKey(ignore: true)
  _$$ArrivalImplCopyWith<_$ArrivalImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
