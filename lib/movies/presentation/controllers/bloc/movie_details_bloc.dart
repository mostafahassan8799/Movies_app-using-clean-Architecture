import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_movie_detials_usecase.dart';
import 'package:movie_app_clean_architecture/movies/presentation/controllers/bloc/movie_details_state.dart';
part 'movie_details_event.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMovieDetialsUsecase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
  }
  final GetMovieDetialsUsecase getMovieDetialsUsecase;

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
}
