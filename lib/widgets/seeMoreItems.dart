import 'package:flutter/material.dart';
import 'package:watchlist/constants/apiConstants.dart';
import 'package:watchlist/screens/moviePage.dart';

class SeeMoreMovies extends StatelessWidget {
  const SeeMoreMovies({super.key, required this.snapshot, required this.index});

  final AsyncSnapshot snapshot;
  final int index;

  @override
  Widget build(BuildContext context) {

    double deviceWidth = MediaQuery.of(context).size.width;
    double imageWidth = deviceWidth * 0.45;

    return Container(
      width: imageWidth,
      height: 277.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.transparent,
      ),
      child: GestureDetector(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MoviePage(
                movie: snapshot.data[index],
              ),
            ),
          );
        },
        child: Stack(
          children: [
            /* Image */
            SizedBox(
              width: imageWidth,
              height: 277.0,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(
                  "${ApiConstants.imagePath}${snapshot.data[index].posterPath}",
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            /* Black filter for image */
            Container(
              width: imageWidth,
              height: 277.0,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            /* Text */
            Positioned(
              bottom: 35.0,
              left: 10.0,
              child: Container(
                width: deviceWidth * 0.38,
                height: 50.0,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    "${index+1} - ${snapshot.data[index].title}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
