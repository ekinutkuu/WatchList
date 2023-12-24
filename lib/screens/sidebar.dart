import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {

    Color DarkBlue = Color(0xFF1a2531);
    Color LightBlue = Color(0xFFbcdef8);

    return Drawer(
      width: 250.0,
      shadowColor: DarkBlue,
      backgroundColor: DarkBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      child: ListView(
        children: [
          SizedBox(height: 50.0,),
          Text("Watch List",
          style: TextStyle(
            fontSize: 30.0, fontWeight: FontWeight.bold, color: LightBlue,),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 50.0,),
          ListTile(
            title: const Text("Home"),
            leading: Icon(Icons.home),
            textColor: LightBlue,
            iconColor: LightBlue,
            tileColor: Color(0xFF203745),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            onTap: () {},
          ),
          SizedBox(height: 10.0,),
          ListTile(
            title: const Text("Profile"),
            leading: Icon(Icons.person),
            textColor: LightBlue,
            iconColor: LightBlue,
            onTap: (){},
          ),
          SizedBox(height: 10.0,),
          ListTile(
            title: const Text("Watchlist"),
            leading: Icon(Icons.list),
            textColor: LightBlue,
            iconColor: LightBlue,
            onTap: (){},
          ),
          SizedBox(height: 10.0,),
          ListTile(
            title: const Text("Bookmarks"),
            leading: Icon(Icons.bookmark),
            textColor: LightBlue,
            iconColor: LightBlue,
            onTap: (){},
          ),
          SizedBox(height: 10.0,),
          ListTile(
            title: const Text("History"),
            leading: Icon(Icons.history),
            textColor: LightBlue,
            iconColor: LightBlue,
            onTap: (){},
          ),
        ],
      ),
    );
  }
}