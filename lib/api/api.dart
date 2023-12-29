import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:watchlist/api_key.dart';
import 'package:watchlist/models/movie.dart';

class Api{
  static const _trendingURL = 'https://api.themoviedb.org/3/trending/movie/day?api_key=${ApiKey.apiKey}';

  Future<List<Movie>> getTrendingMovies() async{
    final response = await http.get(Uri.parse(_trendingURL));
    if (response.statusCode == 200){
      final decodedData = json.decode(response.body)['results'] as List;
      print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    }
    else{
      throw Exception('Error!');
    }
  }

}