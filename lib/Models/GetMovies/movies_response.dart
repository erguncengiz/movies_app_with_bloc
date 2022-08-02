import 'movie_results_response.dart';

class Movies {
  int? page;
  List<MovieResults>? results;
  int? totalPages;
  int? totalResults;

  Movies({this.page, this.results, this.totalPages, this.totalResults});

  Movies.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <MovieResults>[];
      json['results'].forEach((v) {
        results!.add(MovieResults.fromJson(v));
      });
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      data['results'] = results!.map((v) => v.toJson()).toList();
    }
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
