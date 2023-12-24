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

            /* Trendings */
            SizedBox(height: 15.0),
            Row(
              children: [
                SizedBox(width: 20.0,),
                Expanded(
                  child: Text("Trendings", textAlign: TextAlign.left),
                ),
                Expanded(
                  child: Text("See More...", textAlign: TextAlign.right),
                ),
                SizedBox(width: 20.0,),
              ],
            ),
            SizedBox(height: 15.0,),
            Container(
              color: DarkBlue,
              width: 380.0,
              height: 280.0,
            ),

            /* Action Movies */
            SizedBox(height: 15.0,),
            Row(
              children: [
                SizedBox(width: 20.0,),
                Expanded(
                  child: Text("Action Movies", textAlign: TextAlign.left),
                ),
                Expanded(
                  child: Text("See More...", textAlign: TextAlign.right),
                ),
                SizedBox(width: 20.0,),
              ],
            ),
            SizedBox(height: 15.0,),
            Container(
              color: DarkBlue,
              width: 380.0,
              height: 150.0,
            ),

            /* ... Movies */
            /* ... Movies */
            /* ... Movies */

          ],
        ),
      ),

    );
  }
}
