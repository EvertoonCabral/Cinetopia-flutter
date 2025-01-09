import 'package:cinetopia/app/models/movie.dart';
import 'package:cinetopia/app/services/search_movies_service.dart';

class SearchMoviesViewmodel {
  List<Movie> _movieList = [];

  Future<List<Movie>> getPopularMovies() async {
    SearchMoviesService service = SearchPopularMoviesService();

    _movieList = await service.getMovies();

    return _movieList;
  }

//função de get da variravel de lista, tendo em vista que ela foi deixada privada para nao poder ser alterada.
  List<Movie> get movieList => _movieList;

  Future<List<Movie>> getMovie(String query) async {
    if (query.isEmpty) {
      _movieList = await getPopularMovies();
    } else {
      final SearchMoviesService service = SearchForMovie(query: query);
      _movieList = await service.getMovies();
    }

    return movieList;
  }
}
