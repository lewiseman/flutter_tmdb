import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_desktop/api/home_page/models.dart';
import 'package:tmdb_desktop/api/home_page/services.dart';
import 'package:tmdb_desktop/common/percentage_indicator/tmdb_progress.dart';
import 'package:tmdb_desktop/common/toggle/toggle_tittle.dart';
import 'package:tmdb_desktop/common/toggle/toggler.dart';

class WhatsPopular extends StatefulWidget {
  @override
  _WhatsPopularState createState() => _WhatsPopularState();
}

class _WhatsPopularState extends State<WhatsPopular> {
  ValueNotifier<bool> isOnTv = ValueNotifier(true);
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
                  isFirst: isOnTv,
                  firstTitle: 'On TV',
                  secondTitle: 'In Theaters',
                )
              ],
            ),
          ),
          ValueListenableBuilder(
            builder: (BuildContext context, bool value, Widget? child) {
              return AnimatedCrossFade(
                firstChild: PopularRowTheater(
                  items: getTv('tv/popular'),
                  name: 'On TV',
                ),
                secondChild: PopularRow(
                  items: getPopular('movie/now_playing'),
                  name: 'In Theatres',
                ),
                crossFadeState: value
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(seconds: 1),
              );
            },
            valueListenable: isOnTv,
          ),
        ],
      ),
    );
  }
}

class PopularRow extends StatelessWidget {
  final name;
  final Future<List<Movie>> items;

  const PopularRow({Key? key, this.name, required this.items})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: items,
      builder: (BuildContext context, AsyncSnapshot<List<Movie>> snapshot) {
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
              List<Movie>? movies = snapshot.data;
              return Container(
                padding: EdgeInsets.only(top: 20, left: 40),
                height: 400,
                child: Scrollbar(
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 400, childAspectRatio: 2),
                    itemBuilder: (context, index) {
                      return GridTile(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 255,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://www.themoviedb.org/t/p/w220_and_h330_face/${movies![index].posterPath}',
                                        ),
                                        fit: BoxFit.fitHeight,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${movies[index].originalTitle}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.fade,
                                    ),
                                    Text(
                                      '${movies[index].releaseDate}',
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
              );
            }
            return Text('Snapshot Unknown');
          default:
            return Text('Default unknown');
        }
      },
    );
  }
}

class PopularRowTheater extends StatelessWidget {
  final name;
  final Future<List<Tv>> items;

  const PopularRowTheater({Key? key, this.name, required this.items})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: items,
      builder: (BuildContext context, AsyncSnapshot<List<Tv>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('data');
          case ConnectionState.active:
          case ConnectionState.waiting:
          case ConnectionState.done:
            if (snapshot.hasError) {
              print('${snapshot.data} ooooo');
              return Text(snapshot.error.toString());
            } else if (snapshot.hasData) {
              List<Tv>? shows = snapshot.data;
              return Container(
                padding: EdgeInsets.only(top: 20, left: 40),
                height: 400,
                child: Scrollbar(
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 400, childAspectRatio: 2),
                    itemBuilder: (context, index) {
                      return GridTile(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    height: 255,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://www.themoviedb.org/t/p/w220_and_h330_face/${shows![index].posterPath}',
                                        ),
                                        fit: BoxFit.fitHeight,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: -20,
                                    left: 10,
                                    child: MovieRateIndicator(percent: shows[index].popularity),
                                  )
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25, left: 8, right: 8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${shows[index].name}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                      maxLines: 3,
                                      overflow: TextOverflow.fade,
                                    ),
                                    Text(
                                      '${shows[index].firstAirDate}',
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
              );
            }
            return Text('Snapshot Unknown');
          default:
            return Text('Default unknown');
        }
      },
    );
  }
}
