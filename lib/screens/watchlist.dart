import 'package:flutter/material.dart';
import 'package:watchlist/screens/sidebar.dart';
import 'package:watchlist/constants/colors.dart';
import 'package:watchlist/widgets/watchListItems.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


class Watchlist extends StatefulWidget {
  const Watchlist({super.key});

  @override
  State<Watchlist> createState() => _WatchlistState();
}

class _WatchlistState extends State<Watchlist> {
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
            for(int i=1; i<=10; i++)
              Column(
                children: [
                  WatchListItems(),
                  SizedBox(height: 20.0,),
                ],
              ),
          ],
        ),
      ),

    );
  }
}
