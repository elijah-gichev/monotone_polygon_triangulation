import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monotone_polygon_triangulation/blocs/cubit/polygon_points_cubit.dart';
import 'package:monotone_polygon_triangulation/extension/mapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (_) => PolygonPointsCubit(),
        child: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Point<int>? currentPoint;

  final canvasSize = 500.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('monotone_polygon_triangulation')),
      body: Center(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding: const EdgeInsets.only(top: 100, right: 20),
                width: 150,
                child: Column(
                  children: [
                    Text(currentPoint.toString()),
                    const SizedBox(height: 20),
                    BlocBuilder<PolygonPointsCubit, PolygonPointsState>(
                      builder: (context, state) {
                        return TextButton(
                          onPressed:
                              context.read<PolygonPointsCubit>().closePolygon,
                          child: Text(
                            state.isClosed
                                ? 'Разомкнуть многоугольник'
                                : 'Замкнуть многоугольник',
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: GestureDetector(
                onTapUp: _onTapUp,
                child: Container(
                  height: canvasSize,
                  width: canvasSize,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black45,
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Center(
                    child: BlocBuilder<PolygonPointsCubit, PolygonPointsState>(
                      builder: (context, state) {
                        return CustomPaint(
                          size: Size(canvasSize, canvasSize),
                          painter: PolygonPainter(
                            points: state.points,
                            isClosedPolygon: state.isClosed,
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onTapUp(TapUpDetails tapUpDetails) {
    final localPos = tapUpDetails.localPosition;
    final point = localPos.toPoint();

    setState(() {
      currentPoint = point;
    });
    context.read<PolygonPointsCubit>().addPoint(point);
  }
}

class PolygonPainter extends CustomPainter {
  final bool isClosedPolygon;
  final List<Point<int>> points;

  PolygonPainter({
    required this.points,
    required this.isClosedPolygon,
  });

  final painter = Paint()
    ..color = Colors.black
    ..strokeWidth = 2;

  @override
  void paint(Canvas canvas, Size size) {
    //final center = Offset(size.width / 2, size.height / 2);

    _drawPolygon(canvas);

    if (isClosedPolygon) {
      _closePolygon(canvas);
    }
  }

  @override
  bool shouldRepaint(PolygonPainter oldDelegate) {
    return oldDelegate.points.length != points.length &&
        oldDelegate.isClosedPolygon != isClosedPolygon;
  }

  void _drawPolygon(Canvas canvas) {
    for (int i = 1; i < points.length; ++i) {
      final p1 = points[i - 1].toOffset();
      final p2 = points[i].toOffset();
      canvas.drawLine(p1, p2, painter);
    }
  }

  void _closePolygon(Canvas canvas) {
    final firstOffset = points.first.toOffset();
    final lastOffset = points.last.toOffset();

    canvas.drawLine(firstOffset, lastOffset, painter);
  }
}
