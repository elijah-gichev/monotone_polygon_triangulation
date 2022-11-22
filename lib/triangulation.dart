import 'dart:math';

class Triangulation {
  final List<Point<int>> points;

  var vertices = <Vertice>[];

  Triangulation(this.points) {
    final firstV = Vertice(points.first, points.last, points[1]);
    vertices.add(firstV);

    for (int i = 1; i < points.length - 1; ++i) {
      final v = Vertice(points[i], points[i - 1], points[i + 1]);
      vertices.add(v);
    }

    final lastV = Vertice(points.last, points[points.length - 2], points.first);
    vertices.add(lastV);

    _sort();

    var v = vertices.first;
    while (true) {
      if (v == vertices.last) {
        break;
      } else {
        v.isUpper = true;
        v = vertices.firstWhere((vert) => vert.point == v.next);
      }
    }
  }

  final triangles = <Triangle>[];

  final verticeStack = <Vertice>[];

  List<Triangle> triangulate() {
    int i = 0;
    verticeStack.add(vertices[i]);
    ++i;

    while (true) {
      final vi = vertices[i];
      if (verticeStack.length == 1) {
        verticeStack.add(vi);
        ++i;
      } else {
        final t = verticeStack.length - 1;

        final s1 = verticeStack.first;
        final st = verticeStack[t];
        final st_1 = verticeStack[t - 1];
        // 4a
        final isTriangle = _isCreateTriangle(
          v1: vi.point,
          v2: st.point,
          p: st_1.point,
          isViUpper: true,
        );

        final adjViSt = _adjacent(vi, st);
        final adjViS1 = _adjacent(vi, s1);

        if (adjViSt && !adjViS1 && isTriangle) {
          final triangle = Triangle(st_1.point, st.point, vi.point);
          triangles.add(triangle);
          verticeStack.removeLast();
          verticeStack.add(vi);
        } else if (!adjViSt && adjViS1) {
          //4b
          for (int i = 1; i <= t; ++i) {
            final si_1 = verticeStack[i - 1];
            final si = verticeStack[i];

            final triangle = Triangle(si_1.point, si.point, vi.point);
            triangles.add(triangle);
          }

          verticeStack.clear();
          verticeStack.add(st);
          verticeStack.add(vi);
        } else if (adjViSt && adjViS1) {
          //4c
          for (int i = 1; i <= t; ++i) {
            final si_1 = verticeStack[i - 1];
            final si = verticeStack[i];

            final triangle = Triangle(si_1.point, si.point, vi.point);
            triangles.add(triangle);
          }

          break;
        } else {
          verticeStack.add(vi);
          ++i;
        }
      }
    }

    return triangles;
  }

  void _sort() {
    vertices.sort((a, b) => a.point.x.compareTo(b.point.x));
  }

  bool _adjacent(Vertice v1, Vertice v2) {
    return v1.prev == v2.point || v1.next == v2.point;
  }

  bool _isCreateTriangle({
    required Point<int> v1,
    required Point<int> v2,
    required Point<int> p,
    required bool isViUpper,
  }) {
    final ax = v1.x, ay = v1.y;
    final bx = v2.x, by = v2.y;
    final px = p.x, py = p.y;

    final isCreate = ((bx - ax) * (py - ay)) - ((by - ay) * (px - ax));

    if (!isViUpper) {
      return isCreate > 0 ? true : false;
    } else {
      return isCreate > 0 ? false : true;
    }
  }
}

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

class Vertice {
  final Point<int> point;
  final Point<int> prev;
  final Point<int> next;

  bool isUpper;

  Vertice(
    this.point,
    this.prev,
    this.next, {
    this.isUpper = false,
  });
}
