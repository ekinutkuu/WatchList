import 'package:flutter/material.dart';
import 'package:watchlist/screens/sidebar.dart';
import 'package:watchlist/constants/colors.dart';
import 'package:watchlist/widgets/bookmarksItems.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Bookmarks extends StatefulWidget {
  const Bookmarks({super.key});

  @override
  State<Bookmarks> createState() => _BookmarksState();
}

class _BookmarksState extends State<Bookmarks> {

  List<Map<String, dynamic>> _bookmarks = [];
  final _bookmarksBox = Hive.box('bookmarks_box');

  @override
  void initState(){
    super.initState();
    _refreshBookmarks();
  }

  void _refreshBookmarks() {
    final data = _bookmarksBox.keys.map((key) {
      final movie = _bookmarksBox.get(key);
      return {"key": key, "title": movie["title"], "image": movie["image"]};
    }).toList();

    setState(() {
      _bookmarks = data.reversed.toList();
      print("movies length: ${_bookmarks.length}");
    });
  }

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
