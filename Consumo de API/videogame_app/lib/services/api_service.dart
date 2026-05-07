import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/game.dart';

class ApiService {
  static const String _baseUrl = 'https://api.rawg.io/api';
  static const String _apiKey = '2a39a91f4cc54a818ac0af0ea0f0808c';

  Future<List<Game>> getTrendingGames() async {
    final response = await http.get(Uri.parse('$_baseUrl/games?key=$_apiKey&page_size=20&ordering=-added'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      return results.map((json) => Game.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load games');
    }
  }

  Future<Game> getGameDetails(int id) async {
    final response = await http.get(Uri.parse('$_baseUrl/games/$id?key=$_apiKey'));

    if (response.statusCode == 200) {
      return Game.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load game details');
    }
  }
}
