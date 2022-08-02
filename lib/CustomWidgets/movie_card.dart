import 'package:flutter/material.dart';
import 'package:my_app/Models/GetMovies/movie_results_response.dart';

import '../Resources/constants.dart';
import 'package:my_app/Extensions/string_extensions.dart';

class MovieCard extends StatelessWidget {
  final MovieResults movie;
  final Function? callBackFunction;

  const MovieCard({
    Key? key,
    required this.movie,
    required this.callBackFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBackFunction != null
          ? () {
              callBackFunction!();
            }
          : null,
      child: Column(
        children: [
          Stack(alignment: Alignment.bottomCenter, children: [
            SizedBox(
              width: (MediaQuery.of(context).size.width / 2.2),
              child: movie.backdropPath != null
                  ? Image.network(movie.backdropPath!.addImageEndPoint())
                  : Image.asset(Constants.images.noImage),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 5),
                child: Container(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      movie.voteAverage.toString(),
                      style: Constants.textStyle.orangeBold,
                    ),
                  ),
                ),
              ),
            ),
          ]),
          Container(
            height: 40,
            width: (MediaQuery.of(context).size.width / 2.2),
            decoration:
                BoxDecoration(color: Constants.color.themeColor.withAlpha(220)),
            child: Center(
                child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                movie.title,
                style: Constants.textStyle.whiteRegular,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            )),
          )
        ],
      ),
    );
  }
}
