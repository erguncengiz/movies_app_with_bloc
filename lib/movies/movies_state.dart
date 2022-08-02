import 'package:my_app/Models/GetMovies/movie_results_response.dart';

abstract class MoviesState {
  const MoviesState();
}

class MoviesInitial extends MoviesState {
  const MoviesInitial();
}

class MoviesLoading extends MoviesState {
  const MoviesLoading();
}

class MoviesCompleted extends MoviesState {
  final List<MovieResults> response;
  final bool scrolled;

  const MoviesCompleted(this.response, this.scrolled);
}

class MoviesError extends MoviesState {
  final String message;
  const MoviesError(this.message);
}
