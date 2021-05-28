import 'package:flutter/material.dart';
import 'package:tmdb_desktop/common/dropdown/app_bar_drodown.dart';

class NavItem extends StatefulWidget {
  final String title;
  final Map<String, Widget> items;

  NavItem({Key? key, required this.title, required this.items})
      : super(key: key);

  @override
  _NavItemState createState() => _NavItemState();
}

class _NavItemState extends State<NavItem> {
  List<DropDownItem> finalItems = [];

  @override
  void initState() {
    widget.items.forEach((key, value) {
      finalItems.add(DropDownItem(text: key, pageTo: value, width: 180.0,));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: AppbarDropdown(
        title: widget.title,
        itemList: finalItems,
      ),
    );
  }
}
