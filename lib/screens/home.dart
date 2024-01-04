import 'package:flutter/material.dart';
import 'package:watchlist/screens/sidebar.dart';
import 'package:watchlist/constants/colors.dart';
import 'package:watchlist/widgets/trendings.dart';
import 'package:watchlist/widgets/genreMovies.dart';
import '../api/api.dart';
import '../models/movie.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late Future<List<Movie>> trendingMovies;
  late Future<List<Movie>> actionMovies;
  late Future<List<Movie>> comedyMovies;
  late Future<List<Movie>> adventureMovies;


  @override
  void initState(){
    super.initState();
    trendingMovies = Api().getTrendingMovies();
    actionMovies = Api().getActionMovies();
    adventureMovies = Api().getAdventureMovies();
    comedyMovies = Api().getComedyMovies();
  }

  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      /* sidebar.dart */
      drawer: SideBar(activePage: "Home"),

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /* Search Bar */
            SizedBox(height: 15.0,),
            Align(
              alignment: Alignment.center,
              child: Container(
                height: 55.0,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 10.0,),
                decoration: BoxDecoration(
                  color: PaleBlue,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: Colors.white54,
                      size: 30.0,
                    ),
                    Container(
                      width: 300.0,
                      margin: EdgeInsets.only(left: 15.0),
                      child: TextFormField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search...",
                          hintStyle: TextStyle(color: Colors.white54,),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /* Trendings */
            SizedBox(height: 25.0),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: deviceWidth * 0.65,
                height: 40.0,
                decoration: BoxDecoration(
                  color: GenreContainer,
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Text("Trendings",
                    style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left
                  ),
                ),
              ),
            ),
            SizedBox(height: 25.0,),
            SizedBox(
              child: FutureBuilder(
                future: trendingMovies,
                builder: (context, snapshot){
                  if (snapshot.hasError){
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }
                  else if (snapshot.hasData){
                    return Trendings(snapshot: snapshot,);
                  }
                  else{
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),

            /* Action Movies */
            SizedBox(height: 50.0,),
            Container(
              color: GenreContainer,
              height: 370.0,
              child: Column(
                children: [
                  SizedBox(height: 25.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 25.0,),
                      Text(
                        "Action Movies",
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left
                      ),
                      SizedBox(width: 80.0,),
                      Container(
                        width: 135.0,
                        height: 35.0,
                        child: ElevatedButton(
                          onPressed: (){},
                          child: Text("See More...",
                            style: TextStyle(fontSize: 13.0),
                            textAlign: TextAlign.right
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: DarkBlue,
                          ),
                        ),
                      ),
                      SizedBox(width: 25.0,),
                    ],
                  ),
                  SizedBox(height: 25.0,),
                  SizedBox(
                    child: FutureBuilder(
                      future: actionMovies,
                      builder: (context, snapshot){
                        if (snapshot.hasError){
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }
                        else if (snapshot.hasData){
                          return GenreMovies(snapshot: snapshot,);
                        }
                        else{
                          return const Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),

            /* Comedy Movies */
            SizedBox(height: 35.0,),
            Container(
              color: GenreContainer,
              height: 370.0,
              child: Column(
                children: [
                  SizedBox(height: 25.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 25.0,),
                      Text(
                        "Comedy Movies",
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left
                      ),
                      SizedBox(width: 80.0,),
                      Container(
                        width: 135.0,
                        height: 35.0,
                        child: ElevatedButton(
                          onPressed: (){},
                          child: Text("See More...",
                            style: TextStyle(fontSize: 13.0),
                            textAlign: TextAlign.right
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: DarkBlue,
                          ),
                        ),
                      ),
                      SizedBox(width: 25.0,),
                    ],
                  ),
                  SizedBox(height: 25.0,),
                  SizedBox(
                    child: FutureBuilder(
                      future: comedyMovies,
                      builder: (context, snapshot){
                        if (snapshot.hasError){
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }
                        else if (snapshot.hasData){
                          return GenreMovies(snapshot: snapshot,);
                        }
                        else{
                          return const Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),

            /* Adventure Movies */
            SizedBox(height: 35.0,),
            Container(
              color: GenreContainer,
              height: 370.0,
              child: Column(
                children: [
                  SizedBox(height: 25.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(width: 25.0,),
                      Text(
                        "Adventure Movies",
                        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.left
                      ),
                      SizedBox(width: 60.0,),
                      Container(
                        width: 135.0,
                        height: 35.0,
                        child: ElevatedButton(
                          onPressed: (){},
                          child: Text("See More...",
                            style: TextStyle(fontSize: 13.0),
                            textAlign: TextAlign.right
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: DarkBlue,
                          ),
                        ),
                      ),
                      SizedBox(width: 25.0,),
                    ],
                  ),
                  SizedBox(height: 25.0,),
                  SizedBox(
                    child: FutureBuilder(
                      future: adventureMovies,
                      builder: (context, snapshot){
                        if (snapshot.hasError){
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }
                        else if (snapshot.hasData){
                          return GenreMovies(snapshot: snapshot,);
                        }
                        else{
                          return const Center(child: CircularProgressIndicator());
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),


            SizedBox(height: 35.0,),
          ],
        ),
      ),

    );
  }
}
