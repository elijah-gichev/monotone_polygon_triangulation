import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'polygon_points_state.dart';
part 'polygon_points_cubit.freezed.dart';

class PolygonPointsCubit extends Cubit<PolygonPointsState> {
  PolygonPointsCubit()
      : super(const PolygonPointsState.points(
          points: [],
          isClosed: false,
          isTriangulate: false,
        ));

  void addPoint(Point<int> p) {
    final newPoints = List<Point<int>>.from(state.points)..add(p);
    emit(state.copyWith(points: newPoints));
  }

  void closePolygon() {
    emit(state.copyWith(isClosed: !state.isClosed));
  }

  void triangulatePolygon() {
    emit(state.copyWith(isTriangulate: true));
  }

  void clear() {
    emit(const PolygonPointsState.points(
      points: [],
      isClosed: false,
      isTriangulate: false,
    ));
  }
}
