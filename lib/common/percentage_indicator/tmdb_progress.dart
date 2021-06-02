import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class MovieRateIndicator extends StatefulWidget {
  final percent;

  MovieRateIndicator({Key? key, required this.percent}) : super(key: key);

  @override
  _MovieRateIndicatorState createState() => _MovieRateIndicatorState();
}

class _MovieRateIndicatorState extends State<MovieRateIndicator> {
  bool rated = false;
  Color colorBack = Color(0xFF666666);
  Color colorFront = Color(0xFF20c774);
  @override
  void initState() {
    if (widget.percent != 0) {
      rated = true;
      colorBack = Colors.green.shade100.withOpacity(0.5);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double size = 45;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        color: Color(0xFF081c22),
      ),
      margin: EdgeInsets.only(top: 50),
      width: size,
      height: size,
      child: CustomPaint(
        painter: ProgressPainter(
            colorBack: colorBack,
            colorFront: colorFront,
            percent: widget.percent),
        child: rated ? centerPart() : centerPartNull(),
      ),
    );
  }

  Center centerPart() {
    return Center(
      child: RichText(
        text: TextSpan(
          text: '${widget.percent}',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          children: [
            WidgetSpan(
              child: Transform.translate(
                offset: Offset(1.0, -7.0),
                child: Text(
                  '%',
                  style: TextStyle(color: Colors.white),
                  textScaleFactor: 0.7,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Center centerPartNull() {
    return Center(
      child: Text(
        'NR',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}

class ProgressPainter extends CustomPainter {
  final percent;
  final colorBack;
  final colorFront;

  ProgressPainter(
      {required this.percent,
      required this.colorBack,
      required this.colorFront});
  @override
  void paint(Canvas canvas, Size size) {
    final centerPoint = Offset(size.width * 1 / 2, size.height * 1 / 2);
    final radius = (size.width / 2) - 5;
    final startAngle = (270 * (math.pi / 180));
    final sweepAngle = ((percent * 3.6) * (math.pi / 180));
    final useCenter = false;
    final rect = Rect.fromCircle(center: centerPoint, radius: radius);

    final paint = Paint()
      ..color = colorFront
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final fadeCircle = Paint()
      ..color = colorBack
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2;

    canvas.drawCircle(centerPoint, radius, fadeCircle);
    canvas.drawArc(rect, startAngle, sweepAngle, useCenter, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
