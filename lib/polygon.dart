import 'dart:math';

class Polygon {
  List<Point<int>> points;

  final adjMatrix = <List<bool>>[];

  Polygon(this.points) {
    _fillAdjMatrix();
  }

  bool adjacent(int i1, int i2) {
    return adjMatrix[i1][i2];
  }

  void _fillAdjMatrix() {
    for (int i = 0; i < points.length; ++i) {
      adjMatrix.add(
        List.filled(
          points.length,
          false,
        ),
      );
    }

    for (int i = 0; i < points.length - 1; ++i) {
      adjMatrix[i][i + 1] = true;
      adjMatrix[i + 1][i] = true;
    }
    adjMatrix[points.length - 1][0] = adjMatrix[0][points.length - 1] = true;
  }
}
