import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/API/abstract_helper_functions.dart';
import 'package:my_app/API/helper_functions.dart';
import 'package:my_app/Models/GetMovies/movie_results_response.dart';
import 'package:my_app/movies/movies_state.dart';
import 'package:my_app/resources/constants.dart';

class MoviesCubit extends Cubit<MoviesState> {
  MoviesCubit() : super(const MoviesInitial());

  AbstractHelperFunctions helpers = HelperFunctions();
  ScrollController gridViewController = ScrollController();
  List<MovieResults> movies = List<MovieResults>.empty(growable: true);
  bool scrolled = false;
  int pageNumber = 1;

  Future<void> getMovies() async {
    try {
      emit(const MoviesLoading());
      final response = await helpers.getMovies(
          Constants.api.apiKey, pageNumber, Constants.endPoints.getMovies);
      movies = response.results!;
      emit(MoviesCompleted(movies, scrolled));
    } catch (e) {
      emit(const MoviesError("Something went wrong!"));
    }
  }

  setScrollListener() {
    gridViewController = ScrollController(initialScrollOffset: 5.0)
      ..addListener(scrollListener);
  }

  scrollListener() async {
    if (gridViewController.offset >=
            gridViewController.position.maxScrollExtent &&
        !gridViewController.position.outOfRange) {
      scrolled = true;
      pageNumber += 1;
      await getMoviesWithScroll();
    }
  }

  Future<void> getMoviesWithScroll() async {
    try {
      emit(MoviesCompleted(movies, scrolled));
      var response = await helpers.getMovies(
          Constants.api.apiKey, pageNumber, Constants.endPoints.getMovies);
      movies.addAll(response.results!);
      scrolled = false;
      emit(MoviesCompleted(movies, scrolled));
    } catch (e) {
      emit(const MoviesError("Error!!!"));
    }
  }
}
