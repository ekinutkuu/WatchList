import 'package:flutter/material.dart';
import 'package:watchlist/constants/colors.dart';

class Empty extends StatelessWidget {
  const Empty({super.key});

  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Container(
      width: deviceWidth,
      height: deviceHeight - 165.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/empty.png", width: 90.0, height: 90.0,),
          SizedBox(height: 30.0,),
          Text("There is nothing to show", style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),),
          SizedBox(height: 20.0,),
          Text("Add some movie to track", style: TextStyle(fontSize: 23.0),),
        ],
      ),
    );
  }
}
