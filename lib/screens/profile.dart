import 'package:flutter/material.dart';
import 'package:watchlist/screens/sidebar.dart';
import 'package:watchlist/constants/colors.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:watchlist/widgets/profileData.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  List<Map<String, dynamic>> _movies = [];
  final _movieBox = Hive.box('movie_box');

  String totalMoviesCount = "0";
  String watchingMoviesCount = "0";
  String completedMoviesCount = "0";
  String onHoldMoviesCount = "0";
  String droppedMoviesCount = "0";
  String planToWatchMoviesCount = "0";

  @override
  void initState(){
    super.initState();
    _getMovies();
  }

  void _getMovies() {
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
      _movies = data.toList();

      totalMoviesCount = _movies.length.toString();
      watchingMoviesCount = data.where((movie) => movie["status"] == "Watching").length.toString();
      completedMoviesCount = data.where((movie) => movie["status"] == "Completed").length.toString();
      onHoldMoviesCount = data.where((movie) => movie["status"] == "On Hold").length.toString();
      droppedMoviesCount = data.where((movie) => movie["status"] == "Dropped").length.toString();
      planToWatchMoviesCount = data.where((movie) => movie["status"] == "Plan to Watch").length.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* sidebar.dart */
      drawer: SideBar(activePage: "Profile"),

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
      body: Column(
        children: [
          /* Profile Photo */
          SizedBox(height: 15.0,),
          Container(
            width: 180.0,
            height: 180.0,
            decoration: BoxDecoration(
              color: PaleBlue,
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                image: AssetImage(
                    'assets/default_profile.jpg'),
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high
              ),
            ),
          ),

          /* Data */
          SizedBox(height: 20.0,),
          Container(
            width: 370.0,
            height: 300.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: PaleBlue,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ProfileData(text: "Watching :", data: watchingMoviesCount),
                SizedBox(height: 10.0,),
                ProfileData(text: "Completed :", data: completedMoviesCount),
                SizedBox(height: 10.0,),
                ProfileData(text: "On Hold :", data: onHoldMoviesCount),
                SizedBox(height: 10.0,),
                ProfileData(text: "Dropped :", data: droppedMoviesCount),
                SizedBox(height: 10.0,),
                ProfileData(text: "Plan to Watch :", data: planToWatchMoviesCount),
                SizedBox(height: 10.0,),
                ProfileData(text: "Total :", data: totalMoviesCount),
              ],
            ),
          ),

          /* Watchlist and Bookmarks Buttons */
          SizedBox(height: 20.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.transparent,
                width: 150.0,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.pushNamed(context, "/watchlist");
                  },
                  child: Text("Watch List"),
                ),
              ),
              Container(
                color: Colors.transparent,
                width: 150.0,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: (){},
                  child: Text("Bookmarks"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
