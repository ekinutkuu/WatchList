import 'package:flutter/material.dart';
import 'package:watchlist/constants/apiConstants.dart';
import 'package:watchlist/screens/sidebar.dart';
import 'package:watchlist/constants/colors.dart';
import 'package:watchlist/models/movie.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:watchlist/screens/watchlist.dart';
import 'package:watchlist/widgets/alertBox.dart';
import 'package:watchlist/widgets/selectingStatus.dart';
import 'package:watchlist/widgets/pageTitle.dart';

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
  List<Map<String, dynamic>> _bookmarks = [];
  final _bookmarksBox = Hive.box('bookmarks_box');

  @override
  void initState(){
    super.initState();
    _movie = widget.movie;
    _refreshMovies();
    _refreshBookmarks();
  }

  void _refreshMovies() {
    final data = _movieBox.keys.map((key) {
      final movie = _movieBox.get(key);
      return {
        "key": key,
        "title": movie["title"],
        "image": movie["image"],
        "status": movie["status"]
      };
    }).toList();

    setState(() {
      data.sort((a, b){
        final orderMap = {
          "Watching": 1,
          "Completed": 2,
          "On Hold": 3,
          "Dropped": 4,
          "Plan to Watch": 5
        };
        final orderA = orderMap[a["status"]] ?? 0;
        final orderB = orderMap[b["status"]] ?? 0;
        return orderA.compareTo(orderB);
      });
      _movies = data.toList();
    });
  }

  Future<void> _addMovie(Map<String, dynamic> newMovie) async {
    if (!_movies.any((existingMovie) => existingMovie["title"] == newMovie["title"])) {
      //await _movieBox.add(newMovie);
      final selectedStatus = await showStatusDialog(context);
      await _movieBox.add({
        "title": newMovie["title"],
        "image": newMovie["image"],
        "status": selectedStatus.toString(),
      });
      showAlertDialog(context, "Saved to watchlist");
      _refreshMovies();
    }
    else{
      //print("already exist");
      showAlertDialog(context, "This movie already exist !");
    }
  }

  void _refreshBookmarks() {
    final data = _bookmarksBox.keys.map((key) {
      final movie = _bookmarksBox.get(key);
      return {"key": key, "title": movie["title"], "image": movie["image"], "overview": movie["overview"]};
    }).toList();

    setState(() {
      _bookmarks = data.reversed.toList();
    });
  }

  Future<void> _addBookmarks(Map<String, dynamic> newMovie) async {
    if (!_bookmarks.any((existingMovie) => existingMovie["title"] == newMovie["title"])) {
      await _bookmarksBox.add({
        "title": newMovie["title"],
        "image": newMovie["image"],
        "overview": newMovie["overview"],
      });
      showAlertDialog(context, "Saved to bookmarks");
      _refreshBookmarks();
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
            PageTitle(text: _movie.title, fontSize: 25, color: PaleBlue2,),
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
            Align(
              alignment: Alignment.center,
              child: Container(
                width: deviceWidth - 20.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: PaleBlue2,
                ),
                child: Column(
                  children: [
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
                    SizedBox(height: 25.0,),
                  ],
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
                onPressed: (){
                  _addBookmarks({
                    "title": _movie.title,
                    "image": ApiConstants.imagePath+_movie.posterPath,
                    "overview": _movie.overview,
                  });
                },
                child: Text("Add to bookmarks"),
              ),
            ),
          ],
        ),
      ),

    );
  }
}
