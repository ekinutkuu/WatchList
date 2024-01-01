import 'package:flutter/material.dart';
import 'package:watchlist/screens/sidebar.dart';
import 'package:watchlist/constants/colors.dart';
import 'package:watchlist/widgets/watchListItems.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:watchlist/screens/moviePage.dart';
import 'package:watchlist/models/movie.dart';


class Watchlist extends StatefulWidget {
  const Watchlist({super.key});

  @override
  State<Watchlist> createState() => _WatchlistState();
}

class _WatchlistState extends State<Watchlist> {

  List<Map<String, dynamic>> _movies = [];
  final _movieBox = Hive.box('movie_box');

  @override
  void initState(){
    super.initState();
    _refreshMovies();
    //print(_movies);
    //print(_movies[0]);
    //print(_movies[0]["title"]);
    //print(_movies[0]["image"]);
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
      print("movies length: ${_movies.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* sidebar.dart */
      drawer: SideBar(activePage: "Watchlist"),

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
            Text(
              "Viewing Your Movie List",
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.5,
                color: LightBlue,
              ),
            ),
            SizedBox(height: 20.0,),
            for(int i=0; i <= _movies.length - 1; i++)
              Column(
                children: [
                  WatchListItems(
                    title: _movies[i]["title"],
                    image: _movies[i]["image"],
                    status: _movies[i]["status"],
                  ),
                  SizedBox(height: 20.0,),
                ],
              ),
          ],
        ),
      ),

    );
  }
}
