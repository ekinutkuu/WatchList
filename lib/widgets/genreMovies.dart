import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/apiConstants.dart';
import '../models/movie.dart';

class GenreMovies extends StatelessWidget {
  const GenreMovies({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for(int i=1; i<=10; i++)
            InkWell(
              onTap: (){
                Navigator.pushNamed(context, "/moviePage");
              },
              child: Container(
                width: 185,
                height: 250,
                margin: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: PaleBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SizedBox(
                  height: 300.0,
                  width: 200.0,
                  child: Image.network(
                    "${ApiConstants.imagePath}${snapshot.data[i].posterPath}",
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
