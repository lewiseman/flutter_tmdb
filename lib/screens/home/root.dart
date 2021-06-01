import 'package:flutter/material.dart';
import 'package:tmdb_desktop/root.dart';
import 'package:tmdb_desktop/screens/home/latest_trailers.dart';
import 'package:tmdb_desktop/screens/home/popular.dart';
import 'package:tmdb_desktop/screens/home/search_bar.dart';
import 'package:tmdb_desktop/screens/home/trending.dart';
import 'package:tmdb_desktop/screens/info/root.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return RootConfig(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: size.width * .1),
              child: Column(
                children: [
                  SearchBar(),
                  WhatsPopular(),
                  LatestTrailers(),
                  Trending(),
                  Container(height: 395.53, color: Colors.blue.shade900),
                ],
              ),
            ),
            Info()
          ],
        ),
      ),
    );
  }
}
