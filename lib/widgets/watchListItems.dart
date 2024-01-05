import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'package:watchlist/widgets/selectingStatus.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class WatchListItems extends StatefulWidget {
  const WatchListItems({super.key, required this.movieKey, required this.title, required this.image, required this.status});

  final int movieKey;
  final String title;
  final String image;
  final String status;

  @override
  State<WatchListItems> createState() => _WatchListItemsState();
}

class _WatchListItemsState extends State<WatchListItems> {

  List<Map<String, dynamic>> _movies = [];
  final _movieBox = Hive.box('movie_box');

  @override
  void initState(){
    super.initState();
    _refreshMovies();
  }

  void _refreshMovies() {
    final data = _movieBox.keys.map((key) {
      final movie = _movieBox.get(key);
      return {
        "key": key,
        "title": movie["title"],
        "image": movie["image"],
        "status": movie["status"]
      };
    }).toList();

    setState(() {
      data.sort((a, b){
        final orderMap = {
          "Watching": 1,
          "Completed": 2,
          "On Hold": 3,
          "Dropped": 4,
          "Plan to Watch": 5
        };
        final orderA = orderMap[a["status"]] ?? 0;
        final orderB = orderMap[b["status"]] ?? 0;
        return orderA.compareTo(orderB);
      });
      _movies = data.toList();
    });
  }

  Color getStatusColor(String status) {
    switch (status) {
      case "Watching":
        return Colors.green;
      case "Completed":
        return Color(0xFF1B79BE);
      case "On Hold":
        return Colors.yellow;
      case "Dropped":
        return Colors.red;
      case "Plan to Watch":
        return Colors.grey;
      default:
        return Colors.transparent;
    }
  }

  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;

    String movieTitle = widget.title;
    String movieImage = widget.image;
    String movieStatus = widget.status;

    return Container(
      width: deviceWidth,
      height: 150.0,
      color: PaleBlue2,
      child: Row(
        children: [
          SizedBox(width: deviceWidth * 0.017,),
          Container(
            width: 6.0,
            height: 120.0,
            color: getStatusColor(movieStatus),
          ),
          SizedBox(width: deviceWidth * 0.015,),
          Container(
            width: deviceWidth * 0.2,
            height: 120,
            color: Colors.transparent,
            child: Image.network(
              movieImage,
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: deviceWidth * 0.04,),
          Container(
            width: deviceWidth * 0.40,//* 0.40
            height: 100.0,
            color: Colors.transparent,
            alignment: Alignment.centerLeft,
            child: Text(
              movieTitle,
              style: TextStyle(
                color: Colors.white,
                fontSize: 17.0,
              ),
            ),
          ),
          SizedBox(width: deviceWidth * 0.10,),
          Container(
            width: deviceWidth * 0.15,
            height: 28.0,
            color: Colors.transparent,
            alignment: Alignment.center,
            child: ElevatedButton(
              onPressed: () async {
                final selectedStatus = await showStatusDialog(context);
                for(int i=0; i < _movies.length; i++){
                  if(_movies[i]["key"] == widget.movieKey){
                    selectedStatus == null ? _movies[i]["status"] = movieStatus : _movies[i]["status"] = selectedStatus;
                    final updatedStatus = _movies[i]["status"];
                    await _movieBox.put(widget.movieKey, {
                      "title": _movies[i]["title"],
                      "image": _movies[i]["image"],
                      "status": updatedStatus,
                    });
                  }
                }

                _refreshMovies();

                setState(() {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, "/watchlist");
                });

              },
              child: Text(
                "Edit",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15.0,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: DarkBlue
              ),
            ),
          ),
        ],
      ),
    );
  }
}
