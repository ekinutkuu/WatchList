import 'package:flutter/material.dart';
import 'package:watchlist/constants/apiConstants.dart';
import 'package:watchlist/screens/sidebar.dart';
import 'package:watchlist/constants/colors.dart';
import 'package:watchlist/models/movie.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
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

      body: Column(
        children: [
          SizedBox(height: 20.0,),
          Container(
            width: 175.0,
            height: 250.0,
            child: Image.network(
              "${ApiConstants.imagePath}${movie.posterPath}",
              filterQuality: FilterQuality.high,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 15.0,),
          Text(movie.title),
          SizedBox(height: 20.0,),
          Text("Overview"),
          SizedBox(height: 15.0,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0,),
            child: Text(movie.overview),
          ),
          SizedBox(height: 15.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: (){},
                child: Text("Add to list"),
              ),
              SizedBox(width: 25.0,),
              ElevatedButton(
                onPressed: (){},
                child: Text("Add to bookmarks"),
              ),
            ],
          ),

        ],
      ),

    );
  }
}
