import 'package:flutter/material.dart';
import 'package:watchlist/constants/colors.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

List<Map<String, dynamic>> _bookmarks = [];
final _bookmarksBox = Hive.box('bookmarks_box');

void _refreshBookmarks() {
  final data = _bookmarksBox.keys.map((key) {
    final movie = _bookmarksBox.get(key);
    return {
      "key": key,
      "title": movie["title"],
      "image": movie["image"],
      "overview": movie["overview"]
    };
  }).toList();

  _bookmarks = data.reversed.toList();
}

void showAlertDialogDelete(BuildContext context, String title, String movieTitle) {

  void deleteMovie() {
    _refreshBookmarks();
    for(int i=0; i < _bookmarks.length; i++){
      if(_bookmarks[i]["title"] == movieTitle){
        _bookmarksBox.delete(_bookmarks[i]["key"]);
        _refreshBookmarks();
      }
    }
  }

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        backgroundColor: PaleBlue,
        actions: [
          TextButton(
            onPressed: () {
              deleteMovie();
              Navigator.pop(context);
              Navigator.pushNamed(context, "/bookmarks");
            },
            child: Text("Yes"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("No"),
          ),
        ],
      );
    },
  );
}
