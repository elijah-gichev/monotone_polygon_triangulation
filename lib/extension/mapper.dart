import 'dart:math';
import 'dart:ui';

extension OffsetToIntPoint on Offset {
  Point<int> toPoint() {
    return Point<int>(dx.round(), dy.round());
  }
}

extension PointToOffset on Point<int> {
  Offset toOffset() {
    return Offset(x.toDouble(), y.toDouble());
  }
}
