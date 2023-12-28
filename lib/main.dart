import 'package:flutter/material.dart';
import 'package:watchlist/screens/home.dart';
import 'package:watchlist/screens/profile.dart';
import 'package:watchlist/screens/watchlist.dart';
import 'package:watchlist/screens/moviePage.dart';

void main() => runApp(MaterialApp(

  debugShowCheckedModeBanner: false,
  theme: ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Color(0xFF1a2531),
  ),

  initialRoute: "/",

  routes: {
    "/": (context) => Home(),
    "/profile": (context) => Profile(),
    "/watchlist": (context) => Watchlist(),
    "/moviePage": (context) => MoviePage(),
  },

));