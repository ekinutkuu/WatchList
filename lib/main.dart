import 'package:flutter/material.dart';
import 'package:watchlist/screens/home.dart';
import 'package:watchlist/screens/profile.dart';
import 'package:watchlist/screens/watchlist.dart';
import 'package:watchlist/screens/moviePage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {

  /* Local Database */
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('movie_box');

  runApp(MaterialApp(

    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark().copyWith(
      scaffoldBackgroundColor: Color(0xFF1a2531),
    ),

    initialRoute: "/",

    routes: {
      "/": (context) => Home(),
      "/profile": (context) => Profile(),
      "/watchlist": (context) => Watchlist(),
      //"/moviePage": (context) => MoviePage(),
    },

));
}