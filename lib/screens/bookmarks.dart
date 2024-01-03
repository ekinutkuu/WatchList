import 'package:flutter/material.dart';
import 'package:watchlist/screens/sidebar.dart';
import 'package:watchlist/constants/colors.dart';
import 'package:watchlist/widgets/bookmarksItems.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({super.key});

  @override
  State<Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* sidebar.dart */
      drawer: SideBar(activePage: "Bookmarks"),

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
      body: ListView.builder(
          itemCount: 5,
          padding: EdgeInsets.all(10),
          itemBuilder: (BuildContext context, int index){
            return Column(
              children: [
                BookmarksItems(),
                SizedBox(height: 20.0,),
              ],
            );
          }
        ),

    );
  }
}
