// To parse this JSON data, do
//
//     final nowPlayingResponse = nowPlayingResponseFromJson(jsonString);

import 'dart:convert';

import 'package:peliculas_app/models/movie.dart';



class PopularResponse {
    // Dates dates;
    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    PopularResponse({
        // required this.dates,
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    factory PopularResponse.fromJson(String str) => PopularResponse.fromMap(json.decode(str));

    factory PopularResponse.fromMap(Map<String, dynamic> json) => PopularResponse(
        // dates: Dates.fromMap(json["dates"]),
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    // Map<String, dynamic> toJson() => {
    //     "dates": dates.toJson(),
    //     "page": page,
    //     "results": List<dynamic>.from(results.map((x) => x.toJson())),
    //     "total_pages": totalPages,
    //     "total_results": totalResults,
    // };
}