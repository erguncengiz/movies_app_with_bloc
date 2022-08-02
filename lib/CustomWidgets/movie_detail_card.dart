import 'package:flutter/material.dart';
import 'package:my_app/Extensions/string_extensions.dart';

import '../Models/GetMovies/movie_results_response.dart';
import '../Resources/constants.dart';

class MovieDetailCard extends StatelessWidget {
  final MovieResults movie;

  const MovieDetailCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(alignment: Alignment.bottomCenter, children: [
          movie.backdropPath != null
              ? Image.network(movie.backdropPath!.addImageEndPoint())
              : Image.asset(Constants.images.noImage),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 0, 10),
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    movie.voteAverage.toString(),
                    style:
                        Constants.textStyle.orangeBold.copyWith(fontSize: 20),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
