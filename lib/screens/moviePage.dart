import 'package:flutter/material.dart';
import 'package:watchlist/screens/sidebar.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {

  Color DarkBlue = Color(0xFF1a2531);
  Color LightBlue = Color(0xFFbcdef8);
  Color PaleBlue = Color(0xFF2b3745);

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
            color: PaleBlue,
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
          SizedBox(height: 15.0,),
          Text("Overview"),
          SizedBox(height: 15.0,),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0,),
            child: Text("Young hobbit Frodo Baggins, after inheriting a mysterious ring from his uncle Bilbo, must leave his home in order to keep it from falling into the hands of its evil creator. Along the way, a fellowship is formed to protect the ringbearer and make sure that the ring arrives at its final destination: Mt. Doom, the only place where it can be destroyed."),
          ),

        ],
      ),

    );
  }
}
