import 'package:flutter/material.dart';
import 'package:tmdb_desktop/root.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb_desktop/api/home_page/models.dart';
import 'package:tmdb_desktop/api/home_page/services.dart';

class PopularMovies extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RootConfig(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  'Popular Movies',
                  style: GoogleFonts.poppins(
                      fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 260,
                  ),
                  Container(
                    child: MovieGrid(),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MovieGrid extends StatefulWidget {
  @override
  _MovieGridState createState() => _MovieGridState();
}

class _MovieGridState extends State<MovieGrid> {
  final Future<List<Film>> items = getTrending('day');
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
              List<Film>? shows = snapshot.data;
              return Container(
                padding: EdgeInsets.only(left: 30),
                width: 1052,
                height: 2000,
                child: GridView.builder(
                  itemCount: shows!.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.5,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 180,
                      height: 300,
                      child: Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                              child: Image(
                                height: 273,
                                fit: BoxFit.fill,
                                image: NetworkImage(
                                  'https://www.themoviedb.org/t/p/w220_and_h330_face/${shows[index].posterPath}',
                                ),
                              ),
                            ),
                            Text(
                              '${shows[index].title}',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '${shows[index].releaseDate}',
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            } else {
              return Text('error one');
            }
          default:
            return Text('0000');
        }
      },
    );
  }
}
