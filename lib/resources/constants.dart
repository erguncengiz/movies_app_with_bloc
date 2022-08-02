import 'package:flutter/material.dart';

enum PageState { loading, error, done }

enum SearchState { searching, notSearching }

class Constants {
  static var color = _Colors();
  static var textStyle = _TextStyles();
  static var api = _API();
  static var endPoints = _EndPoints();
  static var images = _Images();
}

class _Colors {
  Color themeColor = const Color.fromRGBO(253, 129, 73, 1);
}

class _TextStyles {
  TextStyle orangeBold =
      const TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold);
  TextStyle whiteRegular = const TextStyle(color: Colors.white);
}

class _API {
  String apiKey = "35ef0461fc4557cf1d256d3335ed7545";
  String baseUrl = "https://api.themoviedb.org/3";
  String imageBaseUrl = "https://image.tmdb.org/t/p/w500";
}

class _EndPoints {
  String getMovies = "/movie/top_rated";
  String searchMovies = "/search/movie";
  String getMovieDetail = "/movie/";
}

class _Images {
  String noImage = "assets/no_image.png";
  String defaultNullImageLink =
      "https://api.themoviedb.org/5vTaUnfrEt6nNmB72MfNHG1p7x.jpg";
}
