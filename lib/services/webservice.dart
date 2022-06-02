import 'dart:convert';
import 'package:flutterapp/models/movie.dart';
import 'package:http/http.dart' as http;

class Webservice {

  Future<List<Movie>> fetchMovies() async {

    //final url = "http://www.omdbapi.com/?s=$keyword&apikey=YOURAPIKEY";
    var url = Uri.https('api.themoviedb.org', '3/movie/now_playing',{
      'language':'es-Es',
      'page': '1',
      'api_key':'b540e145bb1377c4bad7633879b9cd2c'
    });

    final response = await http.get(url);
    if(response.statusCode == 200) {

       final body = jsonDecode(response.body);
       final Iterable json = body["results"];
       return json.map((movie) => Movie.fromJson(movie)).toList();

    } else {
      throw Exception("Unable to perform request!");
    }
  }
}