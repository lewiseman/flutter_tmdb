import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [SearchBarBackgroundImage(), SearchBarText()],
    );
  }
}

class SearchBarBackgroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://www.themoviedb.org/t/p/original/61HnjOhuGBBqDwmOWcohxyHM2kg.jpg'),
            fit: BoxFit.fitWidth),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Color(0xFF033756).withOpacity(0.7),
              Color(0xFF018eb9).withOpacity(0.3)
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBarText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width * .09),
      child: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          RichText(
            text: TextSpan(
                text: 'Welcome\n',
                style: GoogleFonts.poppins(
                    fontSize: (size.width / 1680) * 48,
                    fontWeight: FontWeight.bold),
                children: [
                  TextSpan(
                      text:
                          'Millions of movies, TV shows and people to discover. Explore now.',
                      style: GoogleFonts.poppins(
                          fontSize: (size.width / 1680) * 32,
                          fontWeight: FontWeight.w500))
                ]),
          ),
          SizedBox(
            height: 40,
          ),
          SearchBarSearchArea(),
        ],
      ),
    );
  }
}

class SearchBarSearchArea extends StatefulWidget {
  @override
  _SearchBarSearchAreaState createState() => _SearchBarSearchAreaState();
}

class _SearchBarSearchAreaState extends State<SearchBarSearchArea> {
  Color bgButton = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(32)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              style: GoogleFonts.poppins(),
              decoration: InputDecoration(
                hintText: 'Search for a movie, tv show, person......',
                hintStyle: GoogleFonts.poppins(),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                // isCollapsed: true,
                //isDense: true,
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 26, vertical: 14),
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(32),
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xFF1ed5ab), Color(0xFF03b6e2)],
                ),
              ),
              child: Text(
                'Search',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  color: bgButton,
                ),
              ),
            ),
            onEnter: (e) {
              setState(() {
                bgButton = Colors.black87;
              });
            },
            onExit: (e) {
              setState(() {
                bgButton = Colors.white;
              });
            },
          )
        ],
      ),
    );
  }
}
