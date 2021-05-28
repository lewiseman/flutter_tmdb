import 'package:flutter/material.dart';
import 'package:tmdb_desktop/common/dropdown/abstract.dart';
import 'package:tmdb_desktop/common/logo/tmdb_logo.dart';
import 'package:tmdb_desktop/screens/home/root.dart';

class RootConfig extends StatefulWidget {
  @override
  _RootConfigState createState() => _RootConfigState();
}

class _RootConfigState extends State<RootConfig> {
  List<Widget> appBarItems = [
    Logo(width: 150.0),
    NavItem(
      title: 'Movies',
      items: {
        'Popular': HomePage(),
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
          body: HomePage()),
    );
  }
}

//  AppbarDropdown(
//       title: 'Tv Shows',
//       itemList: [
//         DropDownItem(
//           text: 'Popular',
//           pageTo: HomePage(),
//         ),
//         DropDownItem(
//           text: 'Now Playing',
//           pageTo: HomePage(),
//         ),
//         DropDownItem(
//           text: 'Upcoming',
//           pageTo: HomePage(),
//         ),
//         DropDownItem(
//           text: 'Top Rated',
//           pageTo: HomePage(),
//         ),
//       ],
//     ),