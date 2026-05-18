import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app/models/cast.dart';
import 'package:peliculas_app/models/credits_response.dart';
import 'package:peliculas_app/models/movie.dart';
import 'package:peliculas_app/models/movies_popular.dart';
import 'package:peliculas_app/models/now_playing_response.dart';

class MoviesProvider extends ChangeNotifier {
  
  final String _apiKey = '179d3b3918b06d4edd861bdead1a330f';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-MX';

  List<Movie> OnDisplayMovies = [];
  List<Movie> PopularMovies = [];

  // Caché para no repetir llamadas al casting de la misma película
  Map<int, List<Cast>> _moviesCast = {};

  MoviesProvider(){
    this.getOnDisplayMovies();
    this.getPopularMovies();
  }

  Future<void> getOnDisplayMovies() async{
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {'api_key': _apiKey, 'language': _language, 'page':"1"});
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    print(nowPlayingResponse.results[1]);
    OnDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }

  getPopularMovies() async{
    var url = Uri.https(_baseUrl, '3/movie/popular', {
      'api_key': _apiKey,
      'language': _language,
      'page':"1"
    });
    final response = await http.get(url);
    final popularResponse = PopularResponse.fromJson(response.body);
    PopularMovies = popularResponse.results;
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    if (_moviesCast.containsKey(movieId)) return _moviesCast[movieId]!;

    final url = Uri.https(_baseUrl, '3/movie/$movieId/credits', {
      'api_key': _apiKey,
      'language': _language,
    });

    final response = await http.get(url);
    final creditsResponse = CreditsResponse.fromJson(response.body);

    _moviesCast[movieId] = creditsResponse.cast;
    return creditsResponse.cast;
  }
}