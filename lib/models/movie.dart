import 'package:flutter/material.dart';

class Movie{
  String title;
  String overview;
  String backDropPath;
  String posterPath;

  Movie({
    required this.title,
    required this.overview,
    required this.backDropPath,
    required this.posterPath
  });

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      title: json["title"] ?? "Error Title",
      overview: json["overview"] ?? "Error Overview",
      backDropPath: json["backdrop_path"],
      posterPath: json["poster_path"]
    );
  }

}