import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_movie_detials_usecase.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_recommendation_usecase.dart';
import 'package:movie_app_clean_architecture/movies/presentation/controllers/bloc/movie_details_state.dart';
part 'movie_details_event.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetialsUsecase, this.getRecommendationUsecase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }
  final GetMovieDetialsUsecase getMovieDetialsUsecase;
  final GetRecommendationUsecase getRecommendationUsecase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMovieDetialsUsecase(MovieDetailParameters(movieId: event.id));
    result.fold(
        (l) => emit(state.copyWith(
              movieDetailsState: RequestState.error,
              messageMovieDetail: l.message,
            )),
        (r) => emit(state.copyWith(
              movieDetail: r,
              movieDetailsState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result =
        await getRecommendationUsecase(RecommendationParameters(event.id));
    result.fold(
        (l) => emit(state.copyWith(
              recommendationState: RequestState.error,
              messageRecommendation: l.message,
            )),
        (r) => emit(state.copyWith(
              recommendation: r,
              recommendationState: RequestState.loaded,
            )));
  }
}
