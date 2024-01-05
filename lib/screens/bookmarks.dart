import 'package:flutter/material.dart';
import 'package:watchlist/screens/sidebar.dart';
import 'package:watchlist/constants/colors.dart';
import 'package:watchlist/widgets/bookmarksItems.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:watchlist/widgets/empty.dart';

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
      return {"key": key, "title": movie["title"], "image": movie["image"], "overview": movie["overview"]};
    }).toList();

    setState(() {
      _bookmarks = data.reversed.toList();
      print("bookmarks length: ${_bookmarks.length}");
    });
  }

  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

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
      body: _bookmarks.isEmpty
      /* If bookmarks is empty */
      ? Empty()
      /* If bookmarks isn't empty */
      : Column(
        children: [
          SizedBox(height: 15.0,),
          Container(
            width: deviceWidth * 0.65,
            height: 45.0,
            decoration: BoxDecoration(
              color: GenreContainer,
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "Bookmarks",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
            ),
          ),
          SizedBox(height: 15.0,),
          Expanded(
            child: ListView.builder(
              itemCount: (_bookmarks.length / 2).ceil(),
              padding: EdgeInsets.all(10),
              itemBuilder: (BuildContext context, int index){
                int leftIndex = index * 2;
                int rightIndex = leftIndex + 1;
                return Column(
                  children: [
                    SizedBox(height: 5.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        BookmarksItems(
                          title: _bookmarks[leftIndex]["title"],
                          image: _bookmarks[leftIndex]["image"],
                          overview: _bookmarks[leftIndex]["overview"],
                        ),
                        SizedBox(width: deviceWidth * 0.05,),
                        if (rightIndex < _bookmarks.length)
                          BookmarksItems(
                            title: _bookmarks[rightIndex]["title"],
                            image: _bookmarks[rightIndex]["image"],
                            overview: _bookmarks[rightIndex]["overview"],
                          ),
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.02,),
                  ],
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
