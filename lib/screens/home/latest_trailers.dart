import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_desktop/common/toggle/toggle_tittle.dart';
import 'package:tmdb_desktop/common/toggle/toggler_gradient.dart';
import 'package:tmdb_desktop/api/home_page/models.dart';
import 'package:tmdb_desktop/api/home_page/services.dart';

class LatestTrailers extends StatefulWidget {
  @override
  _LatestTrailersState createState() => _LatestTrailersState();
}

class _LatestTrailersState extends State<LatestTrailers> {
  ValueNotifier<bool> isOnTv = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF0e1d32),
      padding: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    'Latest Trailers',
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                TogglerGradient(
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
                firstChild: TrailerRowTv(
                  items: getTv('tv/popular'),
                  name: 'On TV',
                ),
                secondChild: TrailerRowTv(
                  items: getTv('tv/on_the_air'),
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

class TrailerRowTv extends StatefulWidget {
  final Future<List<Tv>> items;
  final name;
  const TrailerRowTv({Key? key, this.name, required this.items})
      : super(key: key);

  @override
  _TrailerRowTvState createState() => _TrailerRowTvState();
}

class _TrailerRowTvState extends State<TrailerRowTv> {
  List<double> heights = new List.generate(20, (index) => 170);
  double width = 300;
  double height = 170;
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.items,
        builder: (BuildContext context, AsyncSnapshot<List<Tv>> snapshot) {
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
                List<Tv>? films = snapshot.data;
                return Container(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  height: 335,
                  child: Scrollbar(
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 20,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 400,
                        childAspectRatio: 1,
                      ),
                      itemBuilder: (context, index) {
                        return GridTile(
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                MouseRegion(
                                  cursor: SystemMouseCursors.click,
                                  child: AnimatedContainer(
                                    margin: EdgeInsets.only(left: 40),
                                    height: heights[index],
                                    width: width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          'https://www.themoviedb.org/t/p/w355_and_h200_multi_faces/${films![index].backdropPath}',
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    duration: Duration(milliseconds: 200),
                                    curve: Curves.easeInOut,
                                    child: Stack(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onEnter: (e) {
                                    setState(() {
                                      heights[index] = 180;
                                    });
                                  },
                                  onExit: (e) {
                                    setState(() {
                                      heights[index] = 170;
                                    });
                                  },
                                ),
                                Container(
                                  padding: EdgeInsets.all(8),
                                  child: Column(
                                    children: [
                                      Text(
                                        '${films[index].name}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                      ),
                                      Text(
                                        '${films[index].overview}',
                                        style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.white,
                                        ),
                                        overflow: TextOverflow.fade,
                                        textAlign: TextAlign.center,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
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
