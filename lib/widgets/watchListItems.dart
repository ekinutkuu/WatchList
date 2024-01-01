import 'package:flutter/material.dart';
import '../constants/colors.dart';

class WatchListItems extends StatelessWidget {
  const WatchListItems({super.key, required this.title, required this.image, required this.status});

  final String title;
  final String image;
  final String status;

  Color getStatusColor(String status) {
    switch (status) {
      case "Watching":
        return Colors.green;
      case "Completed":
        return Colors.blue;
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

    return Container(
      width: deviceWidth,
      height: 150.0,
      color: PaleBlue,
      child: Row(
        children: [
          SizedBox(width: deviceWidth * 0.017,),
          Container(
            width: 6.0,
            height: 120.0,
            color: getStatusColor(status),
          ),
          SizedBox(width: deviceWidth * 0.015,),
          Container(
            width: deviceWidth * 0.2,
            height: 120,
            color: Colors.transparent,
            child: Image.network(
              image,
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
              title,
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
              onPressed: (){},
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
