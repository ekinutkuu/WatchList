import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:watchlist/constants/colors.dart';

class BookmarksItems extends StatelessWidget {
  const BookmarksItems ({super.key, required this.title, required this.image});

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;
    double imageWidth = deviceWidth * 0.45;

    return Container(
      width: imageWidth,
      height: 277.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.transparent,
      ),
      child: Stack(
        children: [
          /* Image */
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              image,
              filterQuality: FilterQuality.high,
              fit: BoxFit.cover,
            ),
          ),
          /* Black filter for image */
          Container(
            width: imageWidth,
            height: 277.0,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          /* Text */
          Positioned(
            bottom: 35.0,
            left: 10.0,
            child: Container(
              width: deviceWidth * 0.38,
              height: 50.0,
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17.0,
                    color: Colors.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
