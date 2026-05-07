import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app/models/movie.dart';
import 'package:peliculas_app/models/now_playing_response.dart';

class MoviesProvider extends ChangeNotifier {
  
  String _apiKey = '179d3b3918b06d4edd861bdead1a330f';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-MX';


 List<Movie> OnDisplayMovies = [];

  MoviesProvider(){
    this.getOnDisplayMovies();
    print('jelou');
  }

  Future<void> getOnDisplayMovies() async{
    var url = Uri.https(_baseUrl, '3/movie/now_playing', {'api_key': _apiKey, 'language': _language, 'page':"1"});
    final response = await http.get(url);
    final nowPlayingResponse = NowPlayingResponse.fromJson(response.body);
    print(nowPlayingResponse.results[1]);
    OnDisplayMovies = nowPlayingResponse.results;
    notifyListeners();
  }
}