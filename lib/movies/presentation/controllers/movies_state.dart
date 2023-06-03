// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:movie_app_clean_architecture/core/utils/enums.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/movie.dart';

class MoviesState extends Equatable {
  final List<Movie> nowPlayingMovies;
  final RequestState nowPlayingMoviesState;
  final String messageNowPlayingMovies;
  final List<Movie> popularMovies;
  final RequestState popularMoviesState;
  final String messagePopularMovies;
  final List<Movie> topRatedMovies;
  final RequestState topRatedMoviesState;
  final String messageTopRatedMovies;
  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingMoviesState = RequestState.isLoading,
    this.messageNowPlayingMovies = '',
    this.popularMovies = const [],
    this.popularMoviesState = RequestState.isLoading,
    this.messagePopularMovies = '',
    this.topRatedMovies = const [],
    this.topRatedMoviesState = RequestState.isLoading,
    this.messageTopRatedMovies = '',
  });

  MoviesState copyWith({
    List<Movie>? nowPlayingMovies,
    RequestState? nowPlayingMoviesState,
    String? messageNowPlayingMovies,
    List<Movie>? popularMovies,
    RequestState? popularMoviesState,
    String? messagePopularMovies,
    List<Movie>? topRatedMovies,
    RequestState? topRatedMoviesState,
    String? messageTopRatedMovies,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingMoviesState:
          nowPlayingMoviesState ?? this.nowPlayingMoviesState,
      messageNowPlayingMovies:
          messageNowPlayingMovies ?? this.messageNowPlayingMovies,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesState: popularMoviesState ?? this.popularMoviesState,
      messagePopularMovies: messagePopularMovies ?? this.messagePopularMovies,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
      messageTopRatedMovies:
          messageTopRatedMovies ?? this.messageTopRatedMovies,
    );
  }

  @override
  List<Object> get props => [
        nowPlayingMovies,
        nowPlayingMoviesState,
        messageNowPlayingMovies,
        popularMovies,
        popularMoviesState,
        messagePopularMovies,
        topRatedMovies,
        topRatedMoviesState,
        messageTopRatedMovies,
      ];
}
