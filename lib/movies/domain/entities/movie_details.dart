import 'package:equatable/equatable.dart';
import 'package:movie_app_clean_architecture/core/utils/geners.dart';

class MovieDetail extends Equatable {
  final int id;
  final List<Geners> geners;
  final String backdropPath;
  final String overview;
  final String releaseDate;
  final int runtime;
  final String title;
  final double voteAverage;

  const MovieDetail({
    required this.id,
    required this.geners,
    required this.backdropPath,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object?> get props => [
        id,
        geners,
        backdropPath,
        overview,
        releaseDate,
        runtime,
        title,
        voteAverage,
      ];
}
