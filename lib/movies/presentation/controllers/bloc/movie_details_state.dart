import 'package:equatable/equatable.dart';
import 'package:movie_app_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/movie_details.dart';

class MovieDetailsState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState movieDetailsState;
  final String messageMovieDetail;
  const MovieDetailsState(
      {this.movieDetailsState = RequestState.isLoading,
      this.messageMovieDetail = '',
      this.movieDetail});

  @override
  List<Object?> get props =>
      [movieDetail, movieDetailsState, messageMovieDetail];
  MovieDetailsState copyWith(
      {MovieDetail? movieDetail,
      RequestState? movieDetailsState,
      String? messageMovieDetail}) {
    return MovieDetailsState(
        movieDetail: movieDetail ?? this.movieDetail,
        movieDetailsState: movieDetailsState ?? this.movieDetailsState,
        messageMovieDetail: messageMovieDetail ?? this.messageMovieDetail);
  }
}
