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
            Row(
              children: [
                Container(

                ),
              ],
            ),
          ],
        ),
      ),

    );
  }
}
