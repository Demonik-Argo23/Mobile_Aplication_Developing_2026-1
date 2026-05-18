import 'dart:convert';
import 'package:peliculas_app/models/cast.dart';

class CreditsResponse {
  List<Cast> cast;

  CreditsResponse({required this.cast});

  factory CreditsResponse.fromJson(String str) =>
      CreditsResponse.fromMap(json.decode(str));

  factory CreditsResponse.fromMap(Map<String, dynamic> json) => CreditsResponse(
        cast: List<Cast>.from(json["cast"].map((x) => Cast.fromMap(x))),
      );
}
