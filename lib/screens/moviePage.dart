import 'package:flutter/material.dart';
import 'package:watchlist/constants/apiConstants.dart';
import 'package:watchlist/screens/sidebar.dart';
import 'package:watchlist/constants/colors.dart';
import 'package:watchlist/models/movie.dart';
import 'package:watchlist/watchListFunc/watchListFunc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:watchlist/screens/watchlist.dart';
import 'package:watchlist/widgets/alertBox.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key, required this.movie});

  final movie;

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {

  late Movie _movie;

  List<Map<String, dynamic>> _movies = [];
  final _movieBox = Hive.box('movie_box');

  @override
  void initState(){
    super.initState();
    _movie = widget.movie;
    _refreshMovies();
    print("Movies: ${_movies}");
    //print("Movie Box: ${_movieBox}");
  }

  void _refreshMovies() {
    final data = _movieBox.keys.map((key) {
      final movie = _movieBox.get(key);
      return {"key": key, "title": movie["title"], "image": movie["image"]};
    }).toList();

    setState(() {
      _movies = data.reversed.toList();
      print("movies length: ${_movies.length}");
    });
  }

  Future<void> _addMovie(Map<String, dynamic> newMovie) async {
    if (!_movies.any((existingMovie) => existingMovie["title"] == newMovie["title"])) {
      await _movieBox.add(newMovie);
      print("current movies: ${_movieBox.length}");
      _refreshMovies();
    }
    else{
      //print("already exist");
      showAlertDialog(context, "This movie already exist !");
    }

  }

  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      /* sidebar.dart */
      drawer: SideBar(activePage: ""),

      /* App Bar */
      appBar: AppBar(
        title: Image.asset(
          "assets/logo.png",
          fit: BoxFit.cover,
          height: 50.0,
          filterQuality: FilterQuality.high,
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: LightBlue),
        centerTitle: true,
      ),

      /* Body */
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20.0,),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                width: 210.0,
                height: 300.0,
                child: Image.network(
                  "${ApiConstants.imagePath}${_movie.posterPath}",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Text(
              _movie.title,
              style: TextStyle(
                fontSize: 22.0,
              ),
            ),
            SizedBox(height: 20.0,),
            Text(
              "Overview",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20.0,),
              child: Text(
                _movie.overview,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
            ),


            SizedBox(height: 10.0,)
          ],
        ),
      ),

      /* Bottom Buttons */
      bottomNavigationBar: BottomAppBar(
        height: 70.0,
        color: Colors.transparent,
        elevation: 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: deviceWidth*0.45,
              height: 40.0,
              child: ElevatedButton(
                onPressed: (){
                  _addMovie({
                    "title": _movie.title,
                    "image": ApiConstants.imagePath+_movie.posterPath,
                  });
                },
                child: Text("Add to list"),
              ),
            ),
            SizedBox(width: deviceWidth*0.05,),
            Container(
              width: deviceWidth*0.45,
              height: 40.0,
              child: ElevatedButton(
                onPressed: (){},
                child: Text("Add to bookmarks"),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
