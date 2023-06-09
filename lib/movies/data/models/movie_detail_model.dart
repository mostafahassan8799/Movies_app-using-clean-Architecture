import 'package:movie_app_clean_architecture/movies/data/models/geners_model.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/movie_details.dart';

class MovieDetailModel extends MovieDetail {
  const MovieDetailModel({
    required super.id,
    required super.geners,
    required super.backdropPath,
    required super.overview,
    required super.releaseDate,
    required super.runtime,
    required super.title,
    required super.voteAverage,
  });
  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailModel(
          id: json["id"],
          geners: List<GenersModel>.from(
              json["geners"].map((x) => GenersModel.fromJson(x))),
          backdropPath: json["backdrop_path"],
          overview: json["overview"],
          releaseDate: json["release_date"],
          runtime: json["runtime"],
          title: json["title"],
          voteAverage: json["vote_average"].toDouble());
}
