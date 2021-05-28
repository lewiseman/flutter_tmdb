import 'package:flutter/material.dart';
import 'package:tmdb_desktop/root.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TMDB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RootConfig(),
    );
  }
}

