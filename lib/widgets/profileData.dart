import 'package:flutter/material.dart';
import 'package:watchlist/constants/colors.dart';

class ProfileData extends StatelessWidget {
  const ProfileData({super.key, required this.text, required this.data});

  final String text;
  final String data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 160.0,
          height: 38.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: DarkBlue
          ),
          child: Text(text, style: TextStyle(fontSize: 20.0),),
        ),
        Container(
          width: 160.0,
          height: 38.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: DarkBlue
          ),
          child: Text(data, style: TextStyle(fontSize: 20.0),),
        ),
      ],
    );
  }
}
