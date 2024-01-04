import 'package:flutter/material.dart';
import 'package:watchlist/screens/sidebar.dart';
import 'package:watchlist/constants/colors.dart';

class SeeMoreGenreMovies extends StatefulWidget {
  const SeeMoreGenreMovies({super.key});

  @override
  State<SeeMoreGenreMovies> createState() => _SeeMoreGenreMoviesState();
}

class _SeeMoreGenreMoviesState extends State<SeeMoreGenreMovies> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* sidebar.dart */
      drawer: SideBar(activePage: ""),

      /* App Bar */
      appBar: AppBar(
        title: Image.asset(
          "assets/logo.png",
          fit: BoxFit.cover,
          height: 50.0,
          filterQuality: FilterQuality.high,
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: LightBlue),
        centerTitle: true,
      ),

      /* Body */

    );
  }
}
