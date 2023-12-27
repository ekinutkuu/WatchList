import 'package:flutter/material.dart';
import 'package:watchlist/screens/sidebar.dart';

class Watchlist extends StatefulWidget {
  const Watchlist({super.key});

  @override
  State<Watchlist> createState() => _WatchlistState();
}

class _WatchlistState extends State<Watchlist> {

  Color DarkBlue = Color(0xFF1a2531);
  Color LightBlue = Color(0xFFbcdef8);
  Color PaleBlue = Color(0xFF2b3745);

  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;

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
            Container(
              width: deviceWidth,
              height: 150.0,
              color: PaleBlue,
              child: Row(
                children: [
                  SizedBox(width: deviceWidth*0.03,),
                  Container(
                    width: deviceWidth*0.20,
                    height: 100,
                    color: LightBlue,
                    child: Text("Photo", style: TextStyle(color: DarkBlue),),
                  ),
                  SizedBox(width: deviceWidth*0.03,),
                  Container(
                    width: deviceWidth*0.25,
                    height: 30.0,
                    color: LightBlue,
                    child: Text("Name", style: TextStyle(color: DarkBlue),),
                  ),
                  SizedBox(width: deviceWidth*0.05,),
                  Container(
                    width: deviceWidth*0.23,
                    height: 30.0,
                    color: LightBlue,
                    child: Text("+ 24/36", style: TextStyle(color: DarkBlue),),
                  ),
                  SizedBox(width: deviceWidth*0.05,),
                  Container(
                    width: deviceWidth*0.13,
                    height: 25.0,
                    color: LightBlue,
                    child: Text("Edit", style: TextStyle(color: DarkBlue),),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),

    );
  }
}
