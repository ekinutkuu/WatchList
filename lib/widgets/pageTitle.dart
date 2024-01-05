import 'package:flutter/material.dart';
import 'package:watchlist/constants/colors.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({super.key, required this.text, required this.fontSize, required this.color});

  final String text;
  final double fontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: deviceWidth - 20.0,
      height: 50.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
