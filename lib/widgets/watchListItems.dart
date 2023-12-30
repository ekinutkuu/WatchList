import 'package:flutter/material.dart';
import '../constants/colors.dart';

class WatchListItems extends StatelessWidget {
  const WatchListItems({super.key});

  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;

    return Container(
      width: deviceWidth,
      height: 150.0,
      color: PaleBlue,
      child: Row(
        children: [
          SizedBox(width: deviceWidth*0.03,),
          Container(
            width: deviceWidth*0.20,
            height: 100,
            color: LightBlue,
            child: Text("Photo", style: TextStyle(color: DarkBlue),),
          ),
          SizedBox(width: deviceWidth*0.03,),
          Container(
            width: deviceWidth*0.25,
            height: 30.0,
            color: LightBlue,
            child: Text("Name", style: TextStyle(color: DarkBlue),),
          ),
          SizedBox(width: deviceWidth*0.05,),
          Container(
            width: deviceWidth*0.23,
            height: 30.0,
            color: LightBlue,
            child: Text("+ 24/36", style: TextStyle(color: DarkBlue),),
          ),
          SizedBox(width: deviceWidth*0.05,),
          Container(
            width: deviceWidth*0.13,
            height: 25.0,
            color: LightBlue,
            child: Text("Edit", style: TextStyle(color: DarkBlue),),
          ),
        ],
      ),
    );
  }
}
