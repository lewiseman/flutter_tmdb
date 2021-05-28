import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Logo extends StatelessWidget {
  final width;

  const Logo({Key? key, required this.width}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomPaint(
        size: Size(width, (width * 0.12991002852754005).toDouble()),
        painter: RPSCustomPainter(),
      ),
    );
  }
}

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Path path_0 = Path();
    path_0.moveTo(size.width * 0.7016678, size.height * 0.9957770);
    path_0.lineTo(size.width * 0.9353741, size.height * 0.9957770);
    path_0.arcToPoint(Offset(size.width, size.height * 0.4983108),
        radius:
            Radius.elliptical(size.width * 0.06462585, size.height * 0.4974662),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width, size.height * 0.4983108);
    path_0.arcToPoint(Offset(size.width * 0.9353741, 0),
        radius:
            Radius.elliptical(size.width * 0.06462585, size.height * 0.4974662),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width * 0.7016678, 0);
    path_0.arcToPoint(Offset(size.width * 0.6370419, size.height * 0.4983108),
        radius:
            Radius.elliptical(size.width * 0.06462585, size.height * 0.4974662),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width * 0.6370419, size.height * 0.4983108);
    path_0.arcToPoint(Offset(size.width * 0.7016678, size.height * 0.9957770),
        radius:
            Radius.elliptical(size.width * 0.06462585, size.height * 0.4974662),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.close();
    path_0.moveTo(size.width * 0.03693951, size.height * 0.9971847);
    path_0.lineTo(size.width * 0.06546705, size.height * 0.9971847);
    path_0.lineTo(size.width * 0.06546705, size.height * 0.1948198);
    path_0.lineTo(size.width * 0.1024066, size.height * 0.1948198);
    path_0.lineTo(size.width * 0.1024066, 0);
    path_0.lineTo(0, 0);
    path_0.lineTo(0, size.height * 0.1942568);
    path_0.lineTo(size.width * 0.03693951, size.height * 0.1942568);
    path_0.close();
    path_0.moveTo(size.width * 0.1397118, size.height * 0.9971847);
    path_0.lineTo(size.width * 0.1682393, size.height * 0.9971847);
    path_0.lineTo(size.width * 0.1682393, size.height * 0.2322635);
    path_0.lineTo(size.width * 0.1686051, size.height * 0.2322635);
    path_0.lineTo(size.width * 0.2013386, size.height * 0.9966216);
    path_0.lineTo(size.width * 0.2232829, size.height * 0.9966216);
    path_0.lineTo(size.width * 0.2571136, size.height * 0.2322635);
    path_0.lineTo(size.width * 0.2574793, size.height * 0.2322635);
    path_0.lineTo(size.width * 0.2574793, size.height * 0.9966216);
    path_0.lineTo(size.width * 0.2860069, size.height * 0.9966216);
    path_0.lineTo(size.width * 0.2860069, 0);
    path_0.lineTo(size.width * 0.2430327, 0);
    path_0.lineTo(size.width * 0.2130422, size.height * 0.6503378);
    path_0.lineTo(size.width * 0.2126765, size.height * 0.6503378);
    path_0.lineTo(size.width * 0.1828688, 0);
    path_0.lineTo(size.width * 0.1397118, 0);
    path_0.close();
    path_0.moveTo(size.width * 0.3260186, size.height * 0.003378378);
    path_0.lineTo(size.width * 0.3688099, size.height * 0.003378378);
    path_0.arcToPoint(Offset(size.width * 0.3983615, size.height * 0.03153153),
        radius:
            Radius.elliptical(size.width * 0.1227416, size.height * 0.9448198),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.4227562, size.height * 0.1182432),
        radius:
            Radius.elliptical(size.width * 0.06773462, size.height * 0.5213964),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.4393241, size.height * 0.2736486),
        radius:
            Radius.elliptical(size.width * 0.05518982, size.height * 0.4248311),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.4454319, size.height * 0.5059122),
        radius:
            Radius.elliptical(size.width * 0.06766147, size.height * 0.5208333),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.4395070, size.height * 0.7193131),
        radius:
            Radius.elliptical(size.width * 0.06184624, size.height * 0.4760698),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.4234877, size.height * 0.8741554),
        radius:
            Radius.elliptical(size.width * 0.05961524, size.height * 0.4588964),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.4002633, size.height * 0.9690315),
        radius:
            Radius.elliptical(size.width * 0.07036793, size.height * 0.5416667),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.3726501, size.height * 1.001408),
        radius:
            Radius.elliptical(size.width * 0.08971546, size.height * 0.6905968),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(size.width * 0.3260186, size.height * 1.001408);
    path_0.close();
    path_0.moveTo(size.width * 0.3545461, size.height * 0.7972973);
    path_0.lineTo(size.width * 0.3691756, size.height * 0.7972973);
    path_0.arcToPoint(Offset(size.width * 0.3874625, size.height * 0.7818131),
        radius:
            Radius.elliptical(size.width * 0.07921878, size.height * 0.6097973),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.4023115, size.height * 0.7319820),
        radius:
            Radius.elliptical(size.width * 0.03869505, size.height * 0.2978604),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.4121132, size.height * 0.6376689),
        radius:
            Radius.elliptical(size.width * 0.03192890, size.height * 0.2457770),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.4157706, size.height * 0.4946509),
        radius:
            Radius.elliptical(size.width * 0.04352279, size.height * 0.3350225),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.4121132, size.height * 0.3673986),
        radius:
            Radius.elliptical(size.width * 0.03609831, size.height * 0.2778716),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.4024943, size.height * 0.2778716),
        radius:
            Radius.elliptical(size.width * 0.03353815, size.height * 0.2581644),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.3884866, size.height * 0.2252252),
        radius:
            Radius.elliptical(size.width * 0.04246215, size.height * 0.3268581),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.3713701, size.height * 0.2074887),
        radius:
            Radius.elliptical(size.width * 0.06239485, size.height * 0.4802928),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width * 0.3545461, size.height * 0.2074887);
    path_0.close();
    path_0.moveTo(size.width * 0.4867603, size.height * 0.003378378);
    path_0.lineTo(size.width * 0.5350377, size.height * 0.003378378);
    path_0.arcToPoint(Offset(size.width * 0.5519713, size.height * 0.01266892),
        radius:
            Radius.elliptical(size.width * 0.1202180, size.height * 0.9253941),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.5672226, size.height * 0.04926802),
        radius:
            Radius.elliptical(size.width * 0.04630239, size.height * 0.3564189),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.5781947, size.height * 0.1258446),
        radius:
            Radius.elliptical(size.width * 0.02903957, size.height * 0.2235360),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.5824007, size.height * 0.2567568),
        radius:
            Radius.elliptical(size.width * 0.03050252, size.height * 0.2347973),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.5762929, size.height * 0.3975225),
        radius:
            Radius.elliptical(size.width * 0.02735718, size.height * 0.2105856),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.5600907, size.height * 0.4769144),
        radius:
            Radius.elliptical(size.width * 0.03339185, size.height * 0.2570383),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(size.width * 0.5600907, size.height * 0.4786036);
    path_0.arcToPoint(Offset(size.width * 0.5717212, size.height * 0.5067568),
        radius:
            Radius.elliptical(size.width * 0.03759783, size.height * 0.2894144),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.5806817, size.height * 0.5588401),
        radius:
            Radius.elliptical(size.width * 0.03112428, size.height * 0.2395833),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.5864238, size.height * 0.6326014),
        radius:
            Radius.elliptical(size.width * 0.02849097, size.height * 0.2193131),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.5884354, size.height * 0.7226914),
        radius:
            Radius.elliptical(size.width * 0.03350157, size.height * 0.2578829),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.5840465, size.height * 0.8544482),
        radius:
            Radius.elliptical(size.width * 0.03116085, size.height * 0.2398649),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.5727087, size.height * 0.9389077),
        radius:
            Radius.elliptical(size.width * 0.03408675, size.height * 0.2623874),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.5570917, size.height * 0.9853604),
        radius:
            Radius.elliptical(size.width * 0.04893570, size.height * 0.3766892),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.arcToPoint(Offset(size.width * 0.5397923, size.height * 0.9994369),
        radius:
            Radius.elliptical(size.width * 0.08229098, size.height * 0.6334459),
        rotation: 0,
        largeArc: false,
        clockwise: true);
    path_0.lineTo(size.width * 0.4867603, size.height * 0.9994369);
    path_0.close();
    path_0.moveTo(size.width * 0.5152878, size.height * 0.4017455);
    path_0.lineTo(size.width * 0.5359520, size.height * 0.4017455);
    path_0.arcToPoint(Offset(size.width * 0.5424621, size.height * 0.3961149),
        radius:
            Radius.elliptical(size.width * 0.02797893, size.height * 0.2153716),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.5482042, size.height * 0.3778153),
        radius:
            Radius.elliptical(size.width * 0.01748226, size.height * 0.1345721),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.5523371, size.height * 0.3440315),
        radius: Radius.elliptical(
            size.width * 0.01254480, size.height * 0.09656532),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.5538732, size.height * 0.2933559),
        radius:
            Radius.elliptical(size.width * 0.01327628, size.height * 0.1021959),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.5522639, size.height * 0.2421171),
        radius: Radius.elliptical(
            size.width * 0.01206934, size.height * 0.09290541),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.5477653, size.height * 0.2103041),
        radius: Radius.elliptical(
            size.width * 0.01250823, size.height * 0.09628378),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.5412918, size.height * 0.1942568),
        radius:
            Radius.elliptical(size.width * 0.02220028, size.height * 0.1708896),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.5345256, size.height * 0.1891892),
        radius:
            Radius.elliptical(size.width * 0.03620803, size.height * 0.2787162),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width * 0.5151415, size.height * 0.1891892);
    path_0.close();
    path_0.moveTo(size.width * 0.5152878, size.height * 0.8141892);
    path_0.lineTo(size.width * 0.5408895, size.height * 0.8141892);
    path_0.arcToPoint(Offset(size.width * 0.5475825, size.height * 0.8085586),
        radius:
            Radius.elliptical(size.width * 0.03024651, size.height * 0.2328266),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.5536903, size.height * 0.7888514),
        radius:
            Radius.elliptical(size.width * 0.01707995, size.height * 0.1314752),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.5581889, size.height * 0.7522523),
        radius:
            Radius.elliptical(size.width * 0.01437349, size.height * 0.1106419),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.5599078, size.height * 0.6973536),
        radius:
            Radius.elliptical(size.width * 0.01389803, size.height * 0.1069820),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.5576403, size.height * 0.6410473),
        radius: Radius.elliptical(
            size.width * 0.01155731, size.height * 0.08896396),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.5518616, size.height * 0.6078266),
        radius:
            Radius.elliptical(size.width * 0.01462951, size.height * 0.1126126),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.5445469, size.height * 0.5923423),
        radius:
            Radius.elliptical(size.width * 0.03010021, size.height * 0.2317005),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.arcToPoint(Offset(size.width * 0.5370492, size.height * 0.5881194),
        radius:
            Radius.elliptical(size.width * 0.05529954, size.height * 0.4256757),
        rotation: 0,
        largeArc: false,
        clockwise: false);
    path_0.lineTo(size.width * 0.5154707, size.height * 0.5881194);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.shader = ui.Gradient.linear(Offset(0, size.height * 0.5000000),
        Offset(size.width, size.height * 0.5000000), [
      Color(0xff90cea1).withOpacity(1),
      Color(0xff3cbec9).withOpacity(1),
      Color(0xff00b3e5).withOpacity(1)
    ], [
      0,
      0.56,
      1
    ]);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
