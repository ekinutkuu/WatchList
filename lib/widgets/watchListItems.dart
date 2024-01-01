import 'package:flutter/material.dart';
import '../constants/colors.dart';

class WatchListItems extends StatelessWidget {
  const WatchListItems({super.key, required this.title, required this.image, required this.status});

  final String title;
  final String image;
  final String status;

  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: deviceWidth,
      height: 150.0,
      color: PaleBlue,
      child: Row(
        children: [
          SizedBox(width: deviceWidth * 0.03,),
          Container(
            width: deviceWidth * 0.2,
            height: 100,
            color: DarkBlue,
            child: Image.network(
              image,
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: deviceWidth * 0.04,),
          Container(
            width: deviceWidth * 0.20,//* 0.40
            height: 100.0,
            color: Colors.transparent,
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
              ),
            ),
          ),
          SizedBox(width: deviceWidth * 0.15,),
          Container(
            width: deviceWidth * 0.13,
            height: 50.0,
            color: Colors.transparent,
            alignment: Alignment.center,
            child: Text(
              status,
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          ),
          SizedBox(width: deviceWidth * 0.10,),
          Container(
            width: deviceWidth * 0.13,
            height: 25.0,
            color: Colors.transparent,
            alignment: Alignment.center,
            child: Text(
              "Edit",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
