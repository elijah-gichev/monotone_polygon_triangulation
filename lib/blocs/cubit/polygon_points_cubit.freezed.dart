// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'polygon_points_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PolygonPointsState {
  List<Point<int>> get points => throw _privateConstructorUsedError;
  bool get isClosed => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Point<int>> points, bool isClosed) points,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Point<int>> points, bool isClosed)? points,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Point<int>> points, bool isClosed)? points,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Points value) points,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Points value)? points,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Points value)? points,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PolygonPointsStateCopyWith<PolygonPointsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PolygonPointsStateCopyWith<$Res> {
  factory $PolygonPointsStateCopyWith(
          PolygonPointsState value, $Res Function(PolygonPointsState) then) =
      _$PolygonPointsStateCopyWithImpl<$Res, PolygonPointsState>;
  @useResult
  $Res call({List<Point<int>> points, bool isClosed});
}

/// @nodoc
class _$PolygonPointsStateCopyWithImpl<$Res, $Val extends PolygonPointsState>
    implements $PolygonPointsStateCopyWith<$Res> {
  _$PolygonPointsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? isClosed = null,
  }) {
    return _then(_value.copyWith(
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Point<int>>,
      isClosed: null == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PointsCopyWith<$Res>
    implements $PolygonPointsStateCopyWith<$Res> {
  factory _$$_PointsCopyWith(_$_Points value, $Res Function(_$_Points) then) =
      __$$_PointsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Point<int>> points, bool isClosed});
}

/// @nodoc
class __$$_PointsCopyWithImpl<$Res>
    extends _$PolygonPointsStateCopyWithImpl<$Res, _$_Points>
    implements _$$_PointsCopyWith<$Res> {
  __$$_PointsCopyWithImpl(_$_Points _value, $Res Function(_$_Points) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? points = null,
    Object? isClosed = null,
  }) {
    return _then(_$_Points(
      points: null == points
          ? _value._points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Point<int>>,
      isClosed: null == isClosed
          ? _value.isClosed
          : isClosed // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Points implements _Points {
  const _$_Points(
      {required final List<Point<int>> points, required this.isClosed})
      : _points = points;

  final List<Point<int>> _points;
  @override
  List<Point<int>> get points {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

  @override
  final bool isClosed;

  @override
  String toString() {
    return 'PolygonPointsState.points(points: $points, isClosed: $isClosed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Points &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            (identical(other.isClosed, isClosed) ||
                other.isClosed == isClosed));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_points), isClosed);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PointsCopyWith<_$_Points> get copyWith =>
      __$$_PointsCopyWithImpl<_$_Points>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Point<int>> points, bool isClosed) points,
  }) {
    return points(this.points, isClosed);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Point<int>> points, bool isClosed)? points,
  }) {
    return points?.call(this.points, isClosed);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Point<int>> points, bool isClosed)? points,
    required TResult orElse(),
  }) {
    if (points != null) {
      return points(this.points, isClosed);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Points value) points,
  }) {
    return points(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Points value)? points,
  }) {
    return points?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Points value)? points,
    required TResult orElse(),
  }) {
    if (points != null) {
      return points(this);
    }
    return orElse();
  }
}

abstract class _Points implements PolygonPointsState {
  const factory _Points(
      {required final List<Point<int>> points,
      required final bool isClosed}) = _$_Points;

  @override
  List<Point<int>> get points;
  @override
  bool get isClosed;
  @override
  @JsonKey(ignore: true)
  _$$_PointsCopyWith<_$_Points> get copyWith =>
      throw _privateConstructorUsedError;
}
