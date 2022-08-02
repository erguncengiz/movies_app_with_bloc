import 'package:my_app/Models/GetMovies/movies_response.dart';
import 'package:my_app/Models/MovieDetails/movie_detail_response.dart';

abstract class AbstractHelperFunctions {
  Future<Movies> getMovies(String apiKey, int pageNumber, String endPoint);
  Future<Movies> searchMovies(
      String apiKey, int pageNumber, String endPoint, String query);
  Future<MovieDetailResponse> getMovieDetails(
      String apiKey, int movieId, String endPoint);
}
