import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moviesdemo/MoviesList/Models/Movie.dart';

class MoviesListBLOC {
  static MoviesListBLOC? _instance;
  static getInstance() {
    _instance ??= MoviesListBLOC();
    return _instance;
  }

  Future<List<Movie>> getMoviesList() async {
    var url = Uri.parse('https://api.themoviedb.org/4/list/1');
    var headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyM2ViMTgwNzE1NWFmNmM5MzczOTU1ZjFkMTBhNDQ5NyIsInN1YiI6IjYxZjZhNjBiYWM4ZTZiMDA0NGY0YzBhZCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ._0pWfZcIm0eOqWpk_NANbiJFEVjmsTmpryNtO-zkQ6o'
    };
    var response = await http.get(url, headers: headers);
    print("reponse.body ${response.body}");
    List<Movie> listOfMovies = [];
    var responseBody = response.body;
    Map<String, dynamic> resultSet = jsonDecode(responseBody);
    print(resultSet["results"]);
    print(resultSet["results"].length);
    print("7=" + Movie.fromJson(resultSet["results"][7]).toString());
    for (int i = 0; i < resultSet["results"].length; i++) {
      print("Index:" + i.toString());
      print(resultSet["results"][i]);
      listOfMovies.add(Movie.fromJson(resultSet["results"][i]));
    }
    print("length =" + listOfMovies.length.toString());
    return listOfMovies;
  }
}
