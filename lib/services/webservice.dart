import 'dart:convert';
import 'package:flutterapp/appData.dart';
import 'package:flutterapp/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class Webservice {

  Future<dynamic> fetchObjects(bool search, String query, int index, [ItemScrollController? itemScrollController]) async {

    //final url = "http://www.omdbapi.com/?s=$keyword&apikey=YOURAPIKEY";

    var url = search?
    Uri.https('api.themoviedb.org', '3/search/movie',{
      'language':'es-Es',
      'query': query,
      'api_key':appData.apy_key
    }):
    Uri.https('api.themoviedb.org', '3/movie/now_playing',{
      'language':'es-Es',
      'page': (index+1).toString(),
      'api_key':appData.apy_key
    });

    final response = await http.get(url);
    if(response.statusCode == 200) {

      //final body = jsonDecode(response.body);
      //final Iterable json = body["results"];
      //return json.map((movie) => Movie.fromJson(movie)).toList();
      if(itemScrollController!=null){
        print(itemScrollController.isAttached);
      }

      //itemScrollController.jumpTo(index: index);
      return jsonDecode(response.body);

    } else {
      throw Exception("Unable to perform request!");
    }
  }
}