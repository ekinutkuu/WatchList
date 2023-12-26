import 'package:flutter/material.dart';
import 'package:watchlist/screens/home.dart';
import 'package:watchlist/screens/profile.dart';

void main() => runApp(MaterialApp(

  debugShowCheckedModeBanner: false,
  theme: ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Color(0xFF1a2531),
  ),

  initialRoute: "/",

  routes: {
    "/": (context) => Home(),
    "/profile": (context) => Profile(),
  },

));