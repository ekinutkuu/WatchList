import 'package:flutter/material.dart';
import 'package:watchlist/screens/sidebar.dart';
import 'package:watchlist/constants/colors.dart';
import 'package:watchlist/widgets/seeMoreItems.dart';
import 'package:watchlist/api/api.dart';
import 'package:watchlist/models/movie.dart';

class SeeMoreGenreMovies extends StatefulWidget {
  const SeeMoreGenreMovies({super.key, required this.genre});

  final String genre;


  @override
  State<SeeMoreGenreMovies> createState() => _SeeMoreGenreMoviesState();
}

class _SeeMoreGenreMoviesState extends State<SeeMoreGenreMovies> {

  late Future<List<Movie>> movies;

  @override
  void initState(){
    super.initState();
    switch(widget.genre){
      case "Action":
        movies = Api().getActionMovies();
      case "Comedy":
        movies = Api().getComedyMovies();
      case "Adventure":
        movies = Api().getAdventureMovies();
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
      body: Column(
        children: [
          SizedBox(height: 15.0,),
          Container(
            width: deviceWidth * 0.65,
            height: 45.0,
            decoration: BoxDecoration(
              color: GenreContainer,
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "${widget.genre} Movies",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          SizedBox(height: 15.0,),
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              padding: EdgeInsets.all(10),
              itemBuilder: (BuildContext context, int index){
                int leftIndex = index * 2;
                int rightIndex = leftIndex + 1;
                return Column(
                  children: [
                    SizedBox(height: 5.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: deviceWidth * 0.45,
                          height: 277.0,
                          child: FutureBuilder(
                            future: movies,
                            builder: (context, snapshot){
                              if (snapshot.hasError){
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              }
                              else if (snapshot.hasData){
                                return SeeMoreMovies(snapshot: snapshot, index: leftIndex,);
                              }
                              else{
                                return const Center(child: CircularProgressIndicator());
                              }
                            },
                          ),
                        ),
                        SizedBox(width: deviceWidth * 0.04,),
                        Container(
                          width: deviceWidth * 0.45,
                          height: 277.0,
                          child: FutureBuilder(
                            future: movies,
                            builder: (context, snapshot){
                              if (snapshot.hasError){
                                return Center(
                                  child: Text(snapshot.error.toString()),
                                );
                              }
                              else if (snapshot.hasData){
                                return SeeMoreMovies(snapshot: snapshot, index: rightIndex,);
                              }
                              else{
                                return const Center(child: CircularProgressIndicator());
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.02,),
                  ],
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
