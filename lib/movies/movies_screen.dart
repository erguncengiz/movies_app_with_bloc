import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/CustomWidgets/errorbody.dart';
import 'package:my_app/CustomWidgets/movie_card.dart';
import 'package:my_app/CustomWidgets/progress.dart';
import 'package:my_app/movies/movies_cubit.dart';
import 'package:my_app/movies/movies_state.dart';
import 'package:my_app/resources/constants.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MoviesScreenState createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  final screenCubit = MoviesCubit();

  @override
  void initState() {
    screenCubit.setScrollListener();
    screenCubit.getMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesCubit(),
      child: buildScaffold(),
    );
  }

  Scaffold buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Welcome",
          style: Constants.textStyle.whiteRegular,
        ),
        backgroundColor: Constants.color.themeColor,
      ),
      body: BlocConsumer<MoviesCubit, MoviesState>(
        bloc: screenCubit,
        listener: (BuildContext context, MoviesState state) {
          if (state is MoviesError) {
            print("Error body!");
          }
        },
        builder: (BuildContext context, MoviesState state) {
          return buildBody(state);
        },
      ),
    );
  }

  Widget buildBody(MoviesState state) {
    if (state is MoviesInitial) {
      return const Center(
        child: Text("Say hi to new state management!"),
      );
    } else if (state is MoviesLoading) {
      return const Progress();
    } else if (state is MoviesCompleted) {
      return Stack(
        children: <Widget>[
          GridView.builder(
            controller: screenCubit.gridViewController,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 3 / 2.4, crossAxisCount: 2),
            itemBuilder: (context, index) => MovieCard(
                movie: state.response[index],
                callBackFunction: () {
                  print("f");
                }),
            itemCount: state.response.length,
          ),
          Visibility(visible: screenCubit.scrolled, child: const Progress()),
        ],
      );
    } else {
      return const ErrorBody(errorMessage: "Something went wrong!");
    }
  }
}
