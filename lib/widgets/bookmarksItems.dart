import 'package:flutter/material.dart';
import 'package:watchlist/constants/colors.dart';

class BookmarksItems extends StatelessWidget {
  const BookmarksItems ({super.key});

  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: deviceWidth * 0.4,
          height: 225.0,
          color: PaleBlue,
        ),
        SizedBox(width: deviceWidth * 0.1,),
        Container(
          width: deviceWidth * 0.4,
          height: 225.0,
          color: PaleBlue,
        ),
      ],
    );

  }
}
