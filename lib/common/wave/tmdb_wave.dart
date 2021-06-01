import 'package:flutter/material.dart';
import 'dart:ui' as UI;
import 'dart:math' as math;

class MovieWave extends StatelessWidget {
  final appTitle;

  const MovieWave({Key? key, required this.appTitle}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(appTitle),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 50, vertical: 100),
                width: size.width - 100,
                height: size.height / 3,
                child: CustomPaint(
                  painter: WavePainter(),
                  child: Text('hhhhhh'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    int random(min, max) {
      var rn = new math.Random();
      return min + rn.nextInt(max - min);
    }

    double padding = 10.0;
    List<double> xStartPoints = [
      for (double i = padding; i <= size.width; i += padding) i
    ];
    int noItems = xStartPoints.length;
    List<int> itemsHeight = List.generate(noItems, (_) => random(20, 100));
    Map<int, int> itemsHeightMap = itemsHeight.asMap();
    final paint = Paint()
      ..color = Colors.lightBlue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;

    for (int pos in itemsHeightMap.keys) {
      double startX = xStartPoints[pos];
      double endY = 200 - itemsHeightMap[pos]!.ceilToDouble();
      final lineStart = Offset(startX, size.height);
      final lineEnd = Offset(startX, endY);
      paint.shader = UI.Gradient.linear(lineStart, lineEnd,
          [Colors.white.withOpacity(0.3), Color(0xFF08cea4)], [0.30, 1.00]);
      canvas.drawLine(lineStart, lineEnd, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
