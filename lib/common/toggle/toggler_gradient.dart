import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:ui' as UI;

class TogglerGradient extends StatefulWidget {
  final String firstTitle;
  final String secondTitle;
  final ValueNotifier<bool> isFirst;

  TogglerGradient({
    Key? key,
    required this.firstTitle,
    required this.isFirst,
    required this.secondTitle,
  }) : super(key: key);

  @override
  _TogglerGradientState createState() => _TogglerGradientState();
}

class _TogglerGradientState extends State<TogglerGradient> {
  late GlobalKey firstKey;
  RenderBox? firstTextRenderBox;
  late GlobalKey secondKey;
  RenderBox? secondTextRenderBox;
  Gradient toggleActiveColor = LinearGradient(
    colors: [
      Color(0xFFbdfecf),
      Color(0xFF21d6aa),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  Gradient toggleInactiveColor = LinearGradient(
    colors: [
      Colors.white.withOpacity(0),
      Colors.white.withOpacity(0),
    ],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  bool firstToggleActive = true;
  bool secondToggleActive = false;

  textBgActive(RenderBox? renderBox) {
    if (renderBox == null) {
      return Paint();
    }
    Offset from = Offset(renderBox.localToGlobal(Offset.zero).dx,
        renderBox.localToGlobal(Offset.zero).dy);
    Offset to = Offset(renderBox.size.width, renderBox.size.height);
    List<Color> colors = [Color(0xFFb6fbcc), Color(0xFF219282)];
    return Paint()..shader = UI.Gradient.linear(from, to, colors);
  }

  textBgInactive(RenderBox? renderBox) {
    if (renderBox == null) {
      return Paint();
    }
    Offset from = Offset(renderBox.localToGlobal(Offset.zero).dx,
        renderBox.localToGlobal(Offset.zero).dy);
    Offset to = Offset(renderBox.size.width, renderBox.size.height);
    List<Color> colors = [Color(0xFF032541), Color(0xFF032541)];
    return Paint()..shader = UI.Gradient.linear(from, to, colors);
  }

  @override
  void initState() {
    super.initState();
    firstKey = LabeledGlobalKey('first');
    secondKey = LabeledGlobalKey('second');
    WidgetsBinding.instance!.addPostFrameCallback((_) => _recognizeSize());
  }

  void _recognizeSize() {
    setState(() {
      firstTextRenderBox =
          firstKey.currentContext?.findRenderObject() as RenderBox;
      secondTextRenderBox =
          firstKey.currentContext?.findRenderObject() as RenderBox;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        border: Border.all(
          width: 1,
          color: Color(0xFF1ed5a9),
        ),
      ),
      child: Row(
        children: [
          InkWell(
            child: AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                gradient:
                    firstToggleActive ? toggleActiveColor : toggleInactiveColor,
              ),
              duration: Duration(milliseconds: 120),
              child: AnimatedDefaultTextStyle(
                child: Padding(
                  key: firstKey,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                  child: Text(widget.firstTitle),
                ),
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: firstToggleActive ? Color(0xFF0e1d32) : Colors.white,
                ),
                duration: Duration(milliseconds: 1),
              ),
            ),
            onTap: () {
              setState(() {
                firstToggleActive = true;
                secondToggleActive = false;
                widget.isFirst.value = true;
              });
            },
          ),
          InkWell(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  // color: secondToggleActive
                  //     ? toggleActiveColor
                  //     : toggleInactiveColor,
                  borderRadius: BorderRadius.circular(26),
                  gradient: secondToggleActive
                      ? toggleActiveColor
                      : toggleInactiveColor,
                ),
                duration: Duration(milliseconds: 120),
                child: AnimatedDefaultTextStyle(
                  child: Padding(
                    key: secondKey,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 4),
                    child: Text(widget.secondTitle),
                  ),
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color:
                        secondToggleActive ? Color(0xFF0e1d32) : Colors.white,
                  ),
                  duration: Duration(milliseconds: 1),
                ),
              ),
            ),
            onTap: () {
              setState(() {
                secondToggleActive = true;
                firstToggleActive = false;
                widget.isFirst.value = false;
              });
            },
          ),
        ],
      ),
    );
  }
}
