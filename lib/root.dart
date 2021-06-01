import 'package:flutter/material.dart';
import 'package:tmdb_desktop/common/dropdown/abstract.dart';
import 'package:tmdb_desktop/common/logo/tmdb_logo.dart';
import 'package:tmdb_desktop/screens/home/root.dart';
import 'package:tmdb_desktop/screens/movies/popular/root.dart';

class RootConfig extends StatefulWidget {
  final Widget child;

  const RootConfig({Key? key, required this.child}) : super(key: key);
  @override
  _RootConfigState createState() => _RootConfigState();
}

class _RootConfigState extends State<RootConfig> {
  List<Widget> appBarItems = [
    Logo(width: 150.0),
    NavItem(
      title: 'Movies',
      items: {
        'Popular': PopularMovies(),
        'Now Playing': HomePage(),
        'Upcoming': HomePage(),
        'Top Rated': HomePage()
      },
    ),
    NavItem(
      title: 'TV Shows',
      items: {
        'Popular': HomePage(),
        'Airing Today': HomePage(),
        'On TV': HomePage(),
        'Top Rated': HomePage()
      },
    ),
    NavItem(title: 'People', items: {'Popular People': HomePage()}),
    NavItem(title: 'More', items: {
      'Discussions': HomePage(),
      'Leaderboard': HomePage(),
      'Support': HomePage()
    })
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (context, value) {
          return [
            SliverAppBar(
              floating: true,
              pinned: false,
              snap: true,
              title: Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                child: Row(
                  children: appBarItems,
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.add),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.notifications),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: CircleAvatar(
                    child: Text('L'),
                    backgroundColor: Color(0xFFd29001),
                  ),
                )
              ],
              backgroundColor: Color(0xFF032541),
            ),
          ];
        },
        body: widget.child,
      ),
    );
  }
}