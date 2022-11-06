part of 'polygon_points_cubit.dart';

@freezed
class PolygonPointsState with _$PolygonPointsState {
  const factory PolygonPointsState.points({
    required List<Point<int>> points,
    required bool isClosed,
    required bool isTriangulate,
  }) = _Points;
}
