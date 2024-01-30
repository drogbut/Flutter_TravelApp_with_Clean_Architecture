// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'segments.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Segments _$SegmentsFromJson(Map<String, dynamic> json) {
  return _Segments.fromJson(json);
}

/// @nodoc
mixin _$Segments {
  Departure get departure => throw _privateConstructorUsedError;
  Arrival get arrival => throw _privateConstructorUsedError;
  String? get carrierCode => throw _privateConstructorUsedError;
  String? get number => throw _privateConstructorUsedError;
  Aircraft? get aircraft => throw _privateConstructorUsedError;
  Operating? get operating => throw _privateConstructorUsedError;
  String? get duration => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  num? get numberOfStops => throw _privateConstructorUsedError;
  bool? get blacklistedInEU => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SegmentsCopyWith<Segments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SegmentsCopyWith<$Res> {
  factory $SegmentsCopyWith(Segments value, $Res Function(Segments) then) =
      _$SegmentsCopyWithImpl<$Res, Segments>;
  @useResult
  $Res call(
      {Departure departure,
      Arrival arrival,
      String? carrierCode,
      String? number,
      Aircraft? aircraft,
      Operating? operating,
      String? duration,
      String? id,
      num? numberOfStops,
      bool? blacklistedInEU});

  $DepartureCopyWith<$Res> get departure;
  $ArrivalCopyWith<$Res> get arrival;
  $AircraftCopyWith<$Res>? get aircraft;
  $OperatingCopyWith<$Res>? get operating;
}

/// @nodoc
class _$SegmentsCopyWithImpl<$Res, $Val extends Segments>
    implements $SegmentsCopyWith<$Res> {
  _$SegmentsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? departure = null,
    Object? arrival = null,
    Object? carrierCode = freezed,
    Object? number = freezed,
    Object? aircraft = freezed,
    Object? operating = freezed,
    Object? duration = freezed,
    Object? id = freezed,
    Object? numberOfStops = freezed,
    Object? blacklistedInEU = freezed,
  }) {
    return _then(_value.copyWith(
      departure: null == departure
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as Departure,
      arrival: null == arrival
          ? _value.arrival
          : arrival // ignore: cast_nullable_to_non_nullable
              as Arrival,
      carrierCode: freezed == carrierCode
          ? _value.carrierCode
          : carrierCode // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      aircraft: freezed == aircraft
          ? _value.aircraft
          : aircraft // ignore: cast_nullable_to_non_nullable
              as Aircraft?,
      operating: freezed == operating
          ? _value.operating
          : operating // ignore: cast_nullable_to_non_nullable
              as Operating?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfStops: freezed == numberOfStops
          ? _value.numberOfStops
          : numberOfStops // ignore: cast_nullable_to_non_nullable
              as num?,
      blacklistedInEU: freezed == blacklistedInEU
          ? _value.blacklistedInEU
          : blacklistedInEU // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DepartureCopyWith<$Res> get departure {
    return $DepartureCopyWith<$Res>(_value.departure, (value) {
      return _then(_value.copyWith(departure: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ArrivalCopyWith<$Res> get arrival {
    return $ArrivalCopyWith<$Res>(_value.arrival, (value) {
      return _then(_value.copyWith(arrival: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $AircraftCopyWith<$Res>? get aircraft {
    if (_value.aircraft == null) {
      return null;
    }

    return $AircraftCopyWith<$Res>(_value.aircraft!, (value) {
      return _then(_value.copyWith(aircraft: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OperatingCopyWith<$Res>? get operating {
    if (_value.operating == null) {
      return null;
    }

    return $OperatingCopyWith<$Res>(_value.operating!, (value) {
      return _then(_value.copyWith(operating: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SegmentsImplCopyWith<$Res>
    implements $SegmentsCopyWith<$Res> {
  factory _$$SegmentsImplCopyWith(
          _$SegmentsImpl value, $Res Function(_$SegmentsImpl) then) =
      __$$SegmentsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Departure departure,
      Arrival arrival,
      String? carrierCode,
      String? number,
      Aircraft? aircraft,
      Operating? operating,
      String? duration,
      String? id,
      num? numberOfStops,
      bool? blacklistedInEU});

  @override
  $DepartureCopyWith<$Res> get departure;
  @override
  $ArrivalCopyWith<$Res> get arrival;
  @override
  $AircraftCopyWith<$Res>? get aircraft;
  @override
  $OperatingCopyWith<$Res>? get operating;
}

/// @nodoc
class __$$SegmentsImplCopyWithImpl<$Res>
    extends _$SegmentsCopyWithImpl<$Res, _$SegmentsImpl>
    implements _$$SegmentsImplCopyWith<$Res> {
  __$$SegmentsImplCopyWithImpl(
      _$SegmentsImpl _value, $Res Function(_$SegmentsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? departure = null,
    Object? arrival = null,
    Object? carrierCode = freezed,
    Object? number = freezed,
    Object? aircraft = freezed,
    Object? operating = freezed,
    Object? duration = freezed,
    Object? id = freezed,
    Object? numberOfStops = freezed,
    Object? blacklistedInEU = freezed,
  }) {
    return _then(_$SegmentsImpl(
      departure: null == departure
          ? _value.departure
          : departure // ignore: cast_nullable_to_non_nullable
              as Departure,
      arrival: null == arrival
          ? _value.arrival
          : arrival // ignore: cast_nullable_to_non_nullable
              as Arrival,
      carrierCode: freezed == carrierCode
          ? _value.carrierCode
          : carrierCode // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      aircraft: freezed == aircraft
          ? _value.aircraft
          : aircraft // ignore: cast_nullable_to_non_nullable
              as Aircraft?,
      operating: freezed == operating
          ? _value.operating
          : operating // ignore: cast_nullable_to_non_nullable
              as Operating?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfStops: freezed == numberOfStops
          ? _value.numberOfStops
          : numberOfStops // ignore: cast_nullable_to_non_nullable
              as num?,
      blacklistedInEU: freezed == blacklistedInEU
          ? _value.blacklistedInEU
          : blacklistedInEU // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SegmentsImpl implements _Segments {
  const _$SegmentsImpl(
      {required this.departure,
      required this.arrival,
      this.carrierCode,
      this.number,
      this.aircraft,
      this.operating,
      this.duration,
      this.id,
      this.numberOfStops,
      this.blacklistedInEU});

  factory _$SegmentsImpl.fromJson(Map<String, dynamic> json) =>
      _$$SegmentsImplFromJson(json);

  @override
  final Departure departure;
  @override
  final Arrival arrival;
  @override
  final String? carrierCode;
  @override
  final String? number;
  @override
  final Aircraft? aircraft;
  @override
  final Operating? operating;
  @override
  final String? duration;
  @override
  final String? id;
  @override
  final num? numberOfStops;
  @override
  final bool? blacklistedInEU;

  @override
  String toString() {
    return 'Segments(departure: $departure, arrival: $arrival, carrierCode: $carrierCode, number: $number, aircraft: $aircraft, operating: $operating, duration: $duration, id: $id, numberOfStops: $numberOfStops, blacklistedInEU: $blacklistedInEU)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SegmentsImpl &&
            (identical(other.departure, departure) ||
                other.departure == departure) &&
            (identical(other.arrival, arrival) || other.arrival == arrival) &&
            (identical(other.carrierCode, carrierCode) ||
                other.carrierCode == carrierCode) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.aircraft, aircraft) ||
                other.aircraft == aircraft) &&
            (identical(other.operating, operating) ||
                other.operating == operating) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.numberOfStops, numberOfStops) ||
                other.numberOfStops == numberOfStops) &&
            (identical(other.blacklistedInEU, blacklistedInEU) ||
                other.blacklistedInEU == blacklistedInEU));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      departure,
      arrival,
      carrierCode,
      number,
      aircraft,
      operating,
      duration,
      id,
      numberOfStops,
      blacklistedInEU);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SegmentsImplCopyWith<_$SegmentsImpl> get copyWith =>
      __$$SegmentsImplCopyWithImpl<_$SegmentsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SegmentsImplToJson(
      this,
    );
  }
}

abstract class _Segments implements Segments {
  const factory _Segments(
      {required final Departure departure,
      required final Arrival arrival,
      final String? carrierCode,
      final String? number,
      final Aircraft? aircraft,
      final Operating? operating,
      final String? duration,
      final String? id,
      final num? numberOfStops,
      final bool? blacklistedInEU}) = _$SegmentsImpl;

  factory _Segments.fromJson(Map<String, dynamic> json) =
      _$SegmentsImpl.fromJson;

  @override
  Departure get departure;
  @override
  Arrival get arrival;
  @override
  String? get carrierCode;
  @override
  String? get number;
  @override
  Aircraft? get aircraft;
  @override
  Operating? get operating;
  @override
  String? get duration;
  @override
  String? get id;
  @override
  num? get numberOfStops;
  @override
  bool? get blacklistedInEU;
  @override
  @JsonKey(ignore: true)
  _$$SegmentsImplCopyWith<_$SegmentsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
