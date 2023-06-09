import 'package:equatable/equatable.dart';
import 'package:movie_app_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/movie_details.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/recommendation.dart';

class MovieDetailsState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState movieDetailsState;
  final String messageMovieDetail;
  final List<Recommendation> recommendation;
  final RequestState recommendationState;
  final String messageRecommendation;
  const MovieDetailsState({
    this.movieDetailsState = RequestState.isLoading,
    this.messageMovieDetail = '',
    this.movieDetail,
    this.recommendationState = RequestState.isLoading,
    this.messageRecommendation = '',
    this.recommendation = const [],
  });

  @override
  List<Object?> get props => [
        movieDetail,
        movieDetailsState,
        messageMovieDetail,
        recommendation,
        recommendationState,
        messageRecommendation,
      ];
  MovieDetailsState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailsState,
    String? messageMovieDetail,
    List<Recommendation>? recommendation,
    RequestState? recommendationState,
    String? messageRecommendation,
  }) {
    return MovieDetailsState(
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      messageMovieDetail: messageMovieDetail ?? this.messageMovieDetail,
      recommendation: recommendation ?? this.recommendation,
      recommendationState: recommendationState ?? this.recommendationState,
      messageRecommendation:
          messageRecommendation ?? this.messageRecommendation,
    );
  }
}
