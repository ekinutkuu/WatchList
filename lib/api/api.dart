import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:watchlist/api_key2.dart';
import 'package:watchlist/models/movie.dart';

class Api{
  static const _trendingURL = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${ApiKey.apiKey}';
  static const _actionMoviesURL = 'https://api.themoviedb.org/3/discover/movie?&sort_by=popularity.desc&with_genres=28&api_key=${ApiKey.apiKey}';
  static const _comedyMoviesURL = 'https://api.themoviedb.org/3/discover/movie?&sort_by=popularity.desc&with_genres=35&api_key=${ApiKey.apiKey}';
  static const _adventureMoviesURL = 'https://api.themoviedb.org/3/discover/movie?&sort_by=popularity.desc&with_genres=12&api_key=${ApiKey.apiKey}';

  Future<List<Movie>> getTrendingMovies() async{
    final response = await http.get(Uri.parse(_trendingURL));
    if (response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      //print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }
    else{
      throw Exception('Error!');
    }
  }

  Future<List<Movie>> getActionMovies() async{
    final response = await http.get(Uri.parse(_actionMoviesURL));
    if (response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }
    else{
      throw Exception('Error!');
    }
  }

  Future<List<Movie>> getComedyMovies() async{
    final response = await http.get(Uri.parse(_comedyMoviesURL));
    if (response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }
    else{
      throw Exception('Error!');
    }
  }

  Future<List<Movie>> getAdventureMovies() async{
    final response = await http.get(Uri.parse(_adventureMoviesURL));
    if (response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }
    else{
      throw Exception('Error!');
    }
  }

}