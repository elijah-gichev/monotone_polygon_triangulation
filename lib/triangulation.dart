import 'dart:math';

class Triangulation {
  List<Point<int>> points;

  Triangulation(this.points);

  final triangles = <Triangle>[];
  // final currentIndexes = <int>[];

  final currentIndexes = <int>[];

  List<Triangle> triangulate() {
    _sort();

    int s1Index = 0, stIndex = 0, vIndex = 0;

    currentIndexes.add(s1Index);
    ++vIndex;
    currentIndexes.add(vIndex);
    s1Index = currentIndexes.first;
    stIndex = currentIndexes.last;
    ++vIndex;
    while (true) {
      if (vIndex == points.length) {
        break;
      }
      // 4a
      if (_adjacent(stIndex, vIndex) && !_adjacent(s1Index, vIndex)) {
        final t = currentIndexes.length - 1;

        final st_1 = points[currentIndexes[t - 1]];
        final st = points[currentIndexes[t]];
        final v = points[vIndex];

        final triangle = Triangle(st_1, st, v);
        if (triangle.isLess180Degrees()) {
          triangles.add(triangle);
          currentIndexes.removeLast();
          currentIndexes.add(vIndex);
        }
      } else if (!_adjacent(stIndex, vIndex) && _adjacent(s1Index, vIndex)) {
        //4b
      } else {
        //4c
      }
    }

    return triangles;
  }

  void _sort() {
    points = List.from(points);
    points.sort((a, b) => a.x.compareTo(b.x));
  }

  bool _adjacent(int i1, int i2) {
    final isClosed = ((i1 == points.length - 1) && i2 == 0) ||
        ((i2 == points.length - 1) && i1 == 0);
    final isAdj = i1 + 1 == i2 || i1 - 1 == i2;
    return isAdj || isClosed;
  }
}

// class TriangulationPoint<T extends num> {
//   final Point<T> point;
//   final bool isUpper;

//   TriangulationPoint(this.point, this.isUpper);
// }

class Triangle {
  Point<int> a, b, c;
  Triangle(this.a, this.b, this.c);

  // a - b - c
  bool isLess180Degrees() {
    return getAngle() < 180;
  }

  double getAngle() {
    final x1 = a.x - b.x, x2 = c.x - b.x;
    final y1 = a.y - b.y, y2 = c.y - b.y;
    final d1 = sqrt(x1 * x1 + y1 * y1);
    final d2 = sqrt(x2 * x2 + y2 * y2);
    return acos((x1 * x2 + y1 * y2) / (d1 * d2)) * 180 / pi;
  }

  double getAngleRadian() {
    final x1 = a.x - b.x, x2 = c.x - b.x;
    final y1 = a.y - b.y, y2 = c.y - b.y;
    final d1 = sqrt(x1 * x1 + y1 * y1);
    final d2 = sqrt(x2 * x2 + y2 * y2);
    return acos((x1 * x2 + y1 * y2) / (d1 * d2));
  }
}
