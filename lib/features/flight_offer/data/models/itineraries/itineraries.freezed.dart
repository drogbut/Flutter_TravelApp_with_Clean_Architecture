// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'itineraries.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Itineraries _$ItinerariesFromJson(Map<String, dynamic> json) {
  return _Itineraries.fromJson(json);
}

/// @nodoc
mixin _$Itineraries {
  String? get duration => throw _privateConstructorUsedError;
  Segments? get segments => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ItinerariesCopyWith<Itineraries> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ItinerariesCopyWith<$Res> {
  factory $ItinerariesCopyWith(
          Itineraries value, $Res Function(Itineraries) then) =
      _$ItinerariesCopyWithImpl<$Res, Itineraries>;
  @useResult
  $Res call({String? duration, Segments? segments});

  $SegmentsCopyWith<$Res>? get segments;
}

/// @nodoc
class _$ItinerariesCopyWithImpl<$Res, $Val extends Itineraries>
    implements $ItinerariesCopyWith<$Res> {
  _$ItinerariesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = freezed,
    Object? segments = freezed,
  }) {
    return _then(_value.copyWith(
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      segments: freezed == segments
          ? _value.segments
          : segments // ignore: cast_nullable_to_non_nullable
              as Segments?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SegmentsCopyWith<$Res>? get segments {
    if (_value.segments == null) {
      return null;
    }

    return $SegmentsCopyWith<$Res>(_value.segments!, (value) {
      return _then(_value.copyWith(segments: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ItinerariesImplCopyWith<$Res>
    implements $ItinerariesCopyWith<$Res> {
  factory _$$ItinerariesImplCopyWith(
          _$ItinerariesImpl value, $Res Function(_$ItinerariesImpl) then) =
      __$$ItinerariesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? duration, Segments? segments});

  @override
  $SegmentsCopyWith<$Res>? get segments;
}

/// @nodoc
class __$$ItinerariesImplCopyWithImpl<$Res>
    extends _$ItinerariesCopyWithImpl<$Res, _$ItinerariesImpl>
    implements _$$ItinerariesImplCopyWith<$Res> {
  __$$ItinerariesImplCopyWithImpl(
      _$ItinerariesImpl _value, $Res Function(_$ItinerariesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = freezed,
    Object? segments = freezed,
  }) {
    return _then(_$ItinerariesImpl(
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      segments: freezed == segments
          ? _value.segments
          : segments // ignore: cast_nullable_to_non_nullable
              as Segments?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ItinerariesImpl implements _Itineraries {
  const _$ItinerariesImpl({required this.duration, required this.segments});

  factory _$ItinerariesImpl.fromJson(Map<String, dynamic> json) =>
      _$$ItinerariesImplFromJson(json);

  @override
  final String? duration;
  @override
  final Segments? segments;

  @override
  String toString() {
    return 'Itineraries(duration: $duration, segments: $segments)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ItinerariesImpl &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.segments, segments) ||
                other.segments == segments));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, duration, segments);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ItinerariesImplCopyWith<_$ItinerariesImpl> get copyWith =>
      __$$ItinerariesImplCopyWithImpl<_$ItinerariesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ItinerariesImplToJson(
      this,
    );
  }
}

abstract class _Itineraries implements Itineraries {
  const factory _Itineraries(
      {required final String? duration,
      required final Segments? segments}) = _$ItinerariesImpl;

  factory _Itineraries.fromJson(Map<String, dynamic> json) =
      _$ItinerariesImpl.fromJson;

  @override
  String? get duration;
  @override
  Segments? get segments;
  @override
  @JsonKey(ignore: true)
  _$$ItinerariesImplCopyWith<_$ItinerariesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
