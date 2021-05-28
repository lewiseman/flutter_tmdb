import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_desktop/api/home_page/models.dart';
import 'package:tmdb_desktop/api/home_page/services.dart';
import 'package:tmdb_desktop/common/toggle/toggle_tittle.dart';
import 'package:tmdb_desktop/common/toggle/toggler.dart';

class Trending extends StatefulWidget {
  @override
  _TrendingState createState() => _TrendingState();
}

class _TrendingState extends State<Trending> {
  ValueNotifier<bool> isToday = ValueNotifier(true);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                toggleTittle('What\'s Popular'),
                Toggler(
                  isFirst: isToday,
                  firstTitle: 'Today',
                  secondTitle: 'This Week',
                ),
              ],
            ),
          ),
          ValueListenableBuilder(
            builder: (BuildContext context, bool value, Widget? child) {
              return AnimatedCrossFade(
                firstChild: TrendingRow(
                  items: getTrending('day'),
                ),
                secondChild: TrendingRow(
                  items: getTrending('week'),
                ),
                crossFadeState: value
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(seconds: 1),
              );
            },
            valueListenable: isToday,
          ),
        ],
      ),
    );
  }
}

class TrendingRow extends StatelessWidget {
  final Future<List<Film>> items;

  const TrendingRow({Key? key, required this.items}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: items,
        builder: (BuildContext context, AsyncSnapshot<List<Film>> snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('data');
            case ConnectionState.active:
            case ConnectionState.waiting:
            case ConnectionState.done:
              if (snapshot.hasError) {
                print(snapshot.data);
                return Text(snapshot.error.toString());
              } else if (snapshot.hasData) {
                List<Film>? films = snapshot.data;
                return Container(
                  width: 1300,
                  height: 400,
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20, left: 40),
                        height: 400,
                        child: Scrollbar(
                          child: GridView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 20,
                            gridDelegate:
                                SliverGridDelegateWithMaxCrossAxisExtent(
                                    maxCrossAxisExtent: 400,
                                    childAspectRatio: 2),
                            itemBuilder: (context, index) {
                              return GridTile(
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 255,
                                            width: 150,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                  'https://www.themoviedb.org/t/p/w220_and_h330_face/${films![index].posterPath}',
                                                ),
                                                fit: BoxFit.fitHeight,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '${films[index].title}',
                                              style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                              ),
                                              maxLines: 3,
                                              overflow: TextOverflow.fade,
                                            ),
                                            Text(
                                              '${films[index].releaseDate}',
                                              style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w300,
                                                color: Colors.black54,
                                              ),
                                              maxLines: 1,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Text('first error');
              }
            default:
              return Text('dafault error');
          }
        });
  }
}
