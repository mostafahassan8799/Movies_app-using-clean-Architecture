import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app_clean_architecture/core/usecase/base_usecase.dart';
import 'package:movie_app_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_now_playing_movie_use_case.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_popular_movie_use_case.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_top_rated_movie_use_case.dart';
import 'package:movie_app_clean_architecture/movies/presentation/controllers/movies_event.dart';
import 'package:movie_app_clean_architecture/movies/presentation/controllers/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingMovieUseCase getNowPlayingMovieUseCase;
  final GetPopularMovieUseCase getPopularMovieUseCase;
  final GetTopRatedMovieUseCase getTopRatedMovieUseCase;
  MoviesBloc(this.getNowPlayingMovieUseCase, this.getPopularMovieUseCase,
      this.getTopRatedMovieUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getTopRatedMovies(event, emit) async {
    final result = await getTopRatedMovieUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              topRatedMoviesState: RequestState.error,
              messageTopRatedMovies: l.message,
            )),
        (r) => emit(state.copyWith(
              topRatedMovies: r,
              topRatedMoviesState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getPopularMovies(event, emit) async {
    final result = await getPopularMovieUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              popularMoviesState: RequestState.error,
              messagePopularMovies: l.message,
            )),
        (r) => emit(state.copyWith(
              popularMovies: r,
              popularMoviesState: RequestState.loaded,
            )));
  }

  FutureOr<void> _getNowPlayingMovies(event, emit) async {
    final result = await getNowPlayingMovieUseCase(const NoParameters());
    result.fold(
        (l) => emit(state.copyWith(
              nowPlayingMoviesState: RequestState.error,
              messageNowPlayingMovies: l.message,
            )),
        (r) => emit(state.copyWith(
            nowPlayingMovies: r, nowPlayingMoviesState: RequestState.loaded)));
  }
}
