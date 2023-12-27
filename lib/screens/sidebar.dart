import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {

  final String activePage;
  const SideBar({Key? key, required this.activePage});

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
          Image.asset(
            "assets/logo.png",
            fit: BoxFit.cover,
            height: 50.0,
            filterQuality: FilterQuality.high,),
          SizedBox(height: 50.0,),
          ListTile(
            title: const Text("Home"),
            leading: Icon(Icons.home),
            textColor: LightBlue,
            iconColor: LightBlue,
            tileColor: activePage == "Home" ? Color(0xFF203745) : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            onTap: (){
              Navigator.pushNamed(context, "/");
            },
          ),
          SizedBox(height: 10.0,),
          ListTile(
            title: const Text("Profile"),
            leading: Icon(Icons.person),
            textColor: LightBlue,
            iconColor: LightBlue,
            tileColor: activePage == "Profile" ? Color(0xFF203745) : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            onTap: (){
              Navigator.pushNamed(context, "/profile");
            },
          ),
          SizedBox(height: 10.0,),
          ListTile(
            title: const Text("Watchlist"),
            leading: Icon(Icons.list),
            textColor: LightBlue,
            iconColor: LightBlue,
            tileColor: activePage == "Watchlist" ? Color(0xFF203745) : null,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            onTap: (){
              Navigator.pushNamed(context, "/watchlist");
            },
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
