class Game {
  final int id;
  final String name;
  final String? backgroundImage;
  final double rating;
  final String? released;
  final List<String> genres;
  final String? description;

  Game({
    required this.id,
    required this.name,
    this.backgroundImage,
    required this.rating,
    this.released,
    required this.genres,
    this.description,
  });

  factory Game.fromJson(Map<String, dynamic> json) {
    var genresJson = json['genres'] as List? ?? [];
    List<String> genresList =
        genresJson.map((g) => g['name'] as String).toList();

    return Game(
      id: json['id'],
      name: json['name'],
      backgroundImage: json['background_image'],
      rating: (json['rating'] ?? 0).toDouble(),
      released: json['released'],
      genres: genresList,
      description: json['description_raw'],
    );
  }
}
