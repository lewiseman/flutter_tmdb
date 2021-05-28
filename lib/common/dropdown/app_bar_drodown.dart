import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppbarDropdown extends StatefulWidget {
  final List<DropDownItem> itemList;
  final String title;

  const AppbarDropdown({Key? key, required this.title, required this.itemList})
      : super(key: key);
  @override
  _AppbarDropdownState createState() => _AppbarDropdownState();
}

class _AppbarDropdownState extends State<AppbarDropdown> {
  late GlobalKey actionKey;
  late double height, width, xPosition, yPosition;
  bool isDropdownOpened = false;
  late OverlayEntry floatingDropdown;

  @override
  void initState() {
    actionKey = LabeledGlobalKey(widget.title);
    floatingDropdown = _createFloatingDropdown();
    super.initState();
  }

  void findDropdownData() {
    RenderBox? renderBox =
        actionKey.currentContext?.findRenderObject() as RenderBox?;
    height = renderBox!.size.height;
    width = renderBox.size.width;
    Offset offset = renderBox.localToGlobal(Offset.zero);
    xPosition = offset.dx;
    yPosition = offset.dy;
  }

  OverlayEntry _createFloatingDropdown() {
    double overlayWidth = 180.0;
    return OverlayEntry(builder: (context) {
      return Positioned(
        left: xPosition,
        width: overlayWidth,
        top: yPosition + height,
        height: 4 * height + 60,
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: DropDown(width: overlayWidth, itemList: widget.itemList),
          onExit: (e) {
            floatingDropdown.remove();
            isDropdownOpened = false;
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      key: actionKey,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
        child: Text(
          widget.title,
          style: GoogleFonts.poppins(),
        ),
      ),
      onEnter: (e) {
        if (!isDropdownOpened) {
          findDropdownData();
          Overlay.of(context)!.insert(floatingDropdown);
          isDropdownOpened = true;
        }
      },
      onExit: (e) {
        if (e.position.dy > (yPosition + height)) {
          isDropdownOpened = true;
        } else {
          isDropdownOpened = false;
          floatingDropdown.remove();
        }
      },
    );
  }
}

class DropDown extends StatelessWidget {
  final List<DropDownItem> itemList;
  final double width;

  const DropDown({Key? key, required this.width, required this.itemList})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          Align(
            alignment: Alignment(-0.85, 0),
            child: ClipPath(
              clipper: ArrowClipper(),
              child: Container(
                width: 10,
                height: 5,
                decoration: BoxDecoration(
                  color: CupertinoColors.lightBackgroundGray,
                ),
              ),
            ),
          ),
          Material(
            elevation: 8.0,
            borderRadius: BorderRadius.circular(14),
            child: Container(
              width: width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: CupertinoColors.lightBackgroundGray,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: itemList,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, size.height);
    path.lineTo(size.width / 2, 0);
    path.lineTo(size.width, size.height);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class DropDownItem extends StatefulWidget {
  final String text;
  final Widget pageTo;
  final width;

  const DropDownItem({
    Key? key,
    required this.text,
    required this.pageTo,
    required this.width,
  }) : super(key: key);

  @override
  _DropDownItemState createState() => _DropDownItemState();
}

class _DropDownItemState extends State<DropDownItem> {
  Color activeColor = Colors.black12;
  Color inactiveColor = CupertinoColors.lightBackgroundGray;
  Color bgC = CupertinoColors.lightBackgroundGray;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      child: InkWell(
        onTap: () {},
        child: Container(
          width: widget.width,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: bgC,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Text(widget.text, style: GoogleFonts.poppins(fontSize: 16)),
        ),
      ),
      onEnter: (e) {
        setState(() {
          bgC = activeColor;
        });
      },
      onExit: (e) {
        setState(() {
          bgC = inactiveColor;
        });
      },
    );
  }
}
