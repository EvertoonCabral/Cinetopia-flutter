import 'dart:convert';

import 'package:cinetopia/app/api_key.dart';
import 'package:cinetopia/app/models/movie.dart';
import 'package:http/http.dart' as http;

class SearchMoviesService {

  List<Movie> movies = <Movie>[];

  final String popularMoviesUrl =
      "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1";

  Future<List<Movie>> searchMovies() async {
    try {
      final response = await http.get(Uri.parse(popularMoviesUrl), headers: {
        'accept': 'application/json',
        'Authorization': 'Bearer $api_key'
      });

      if (response.statusCode == 200) {

        for(dynamic movie in json.decode(response.body)['results']){

          movies.add(Movie.fromMap(movie));

        };


      } else {
        throw Exception(response.body);
      }

      return movies;
    } catch (e) {
      print(e);

      return movies;
    }
  }
}
