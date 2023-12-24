import 'package:flutter/material.dart';
import 'package:watchlist/screens/sidebar.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Color DarkBlue = Color(0xFF1a2531);
  Color LightBlue = Color(0xFFbcdef8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* sidebar.dart */
      drawer: SideBar(activePage: "Home"),

      /* App Bar */
      appBar: AppBar(
        title: Text("[Logo] Watch List",
          style: TextStyle(color: LightBlue,),
        ),
        backgroundColor: DarkBlue,
        iconTheme: IconThemeData(color: LightBlue),
        centerTitle: true,
      ),

      /* Body */
      body: SingleChildScrollView(
        child: Column(
          children: [
            /* Search Bar */
            SizedBox(height: 15.0,),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 350.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: DarkBlue,
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
