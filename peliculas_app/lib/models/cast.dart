class Cast {
  String name;
  String? profilePath;

  Cast({
    required this.name,
    this.profilePath,
  });

  String? get fullProfilePath {
    if (profilePath == null) return null;
    return 'https://image.tmdb.org/t/p/w500$profilePath';
  }

  factory Cast.fromMap(Map<String, dynamic> json) => Cast(
        name: json["name"] ?? '',
        profilePath: json["profile_path"],
      );
}
