import 'package:flutter/material.dart';
import 'package:watchlist/screens/sidebar.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  Color DarkBlue = Color(0xFF1a2531);
  Color LightBlue = Color(0xFFbcdef8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* sidebar.dart */
      drawer: SideBar(),

      /* App Bar */
      appBar: AppBar(
        title: Text("[Logo] Watch List",
          style: TextStyle(color: LightBlue,),
        ),
        backgroundColor: DarkBlue,
        iconTheme: IconThemeData(color: LightBlue),
        centerTitle: true,
      ),

      /* Body */
      body: Column(
        children: [
          /* Photo and Data */
          SizedBox(height: 15.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: DarkBlue,
                width: 180.0,
                height: 200.0,
              ),
              Container(
                color: DarkBlue,
                width: 150.0,
                height: 170.0,
              ),
            ],
          ),

          /* History Title and See More*/
          SizedBox(height: 15.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: DarkBlue,
                width: 150.0,
                height: 40.0,
              ),
              Container(
                color: DarkBlue,
                width: 150.0,
                height: 40.0,
              ),
            ],
          ),

          /* History list */
          SizedBox(height: 15.0,),
          Container(
            color: DarkBlue,
            width: 400.0,
            height: 200.0,
          ),

          /* Watchlist and Bookmarks Buttons */
          SizedBox(height: 15.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: DarkBlue,
                width: 150.0,
                height: 40.0,
              ),
              Container(
                color: DarkBlue,
                width: 150.0,
                height: 40.0,
              ),
            ],
          ),
        ],
      ),

    );
  }
}
