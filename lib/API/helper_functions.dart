import 'package:my_app/API/abstract_helper_functions.dart';
import 'package:my_app/Models/GetMovies/movies_response.dart';
import 'package:dio/dio.dart';
import 'package:my_app/Extensions/string_extensions.dart';

import '../Models/MovieDetails/movie_detail_response.dart';

class HelperFunctions extends AbstractHelperFunctions {
  @override
  Future<Movies> getMovies(
      String apiKey, int pageNumber, String endPoint) async {
    Movies response;
    var dio = Dio();

    Response tmpResponse = await dio.get(endPoint.addEndPoint(),
        queryParameters: {
          'api_key': apiKey,
          'page': pageNumber,
          'language': "en-US"
        });
    response = Movies.fromJson(tmpResponse.data);
    return response;
  }

  @override
  Future<Movies> searchMovies(
      String apiKey, int pageNumber, String endPoint, String query) async {
    Movies response;
    var dio = Dio();

    Response tmpResponse = await dio.get(endPoint.addEndPoint(),
        queryParameters: {
          'api_key': apiKey,
          'page': pageNumber,
          'language': "en-US",
          'query': query
        });
    response = Movies.fromJson(tmpResponse.data);
    return response;
  }

  @override
  Future<MovieDetailResponse> getMovieDetails(
      String apiKey, int movieId, String endPoint) async {
    MovieDetailResponse response;
    var dio = Dio();

    Response tmpResponse =
        await dio.get((endPoint + "$movieId").addEndPoint(), queryParameters: {
      'api_key': apiKey,
      'language': "en-US",
    });
    response = MovieDetailResponse.fromJson(tmpResponse.data);
    return response;
  }
}
