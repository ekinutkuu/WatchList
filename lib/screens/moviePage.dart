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
                  "${ApiConstants.imagePath}${movie.posterPath}",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SizedBox(height: 20.0,),
            Text(
              movie.title,
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
                movie.overview,
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
                onPressed: (){},
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
