import 'package:http/http.dart' as http;
import 'package:tmdb_desktop/api/constants.dart';
import 'dart:convert' as convert;
import 'package:tmdb_desktop/api/home_page/models.dart';

Future<List<Tv>> getTv(String item) async {
  final url = Uri.parse(
      'https://api.themoviedb.org/3/$item?api_key=$myApiKey&language=en-US&page=1');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final jsonData = convert.jsonDecode(response.body);
    final jsonBody = jsonData['results'];
    List<Tv> movies =
        List<Tv>.from(jsonBody.map((dynamic body) => Tv.fromJson(body)));
    return movies;
  } else {
    throw Exception('Unable to fetch data from the TMDB API');
  }
}

Future<List<Movie>> getPopular(String type) async {
  final url = Uri.parse(
      'https://api.themoviedb.org/3/$type?api_key=$myApiKey&language=en-US&page=1');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final jsonData = convert.jsonDecode(response.body);
    final jsonBody = jsonData['results'];
    List<Movie> movies =
        List<Movie>.from(jsonBody.map((dynamic body) => Movie.fromJson(body)));
    return movies;
  } else {
    throw Exception('Unable to fetch data from the TMDB API');
  }
}

Future<List<Film>> getTrending(String when) async {
  final url = Uri.parse(
      'https://api.themoviedb.org/3/trending/all/$when?api_key=$myApiKey');
  final response = await http.get(url);
  if (response.statusCode == 200) {
    final jsonData = convert.jsonDecode(response.body);
    final jsonBody = jsonData['results'];
    List<Film> movies =
        List<Film>.from(jsonBody.map((dynamic body) => Film.fromJson(body)));
    return movies;
  } else {
    throw Exception('Unable to fetch data from the TMDB API');
  }
}
