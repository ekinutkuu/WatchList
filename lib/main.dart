import 'package:flutter/material.dart';
import 'package:watchlist/screens/home.dart';
import 'package:watchlist/screens/profile.dart';

void main() => runApp(MaterialApp(

  initialRoute: "/",

  routes: {
    "/": (context) => Home(),
    "/profile": (context) => Profile(),
  },

));