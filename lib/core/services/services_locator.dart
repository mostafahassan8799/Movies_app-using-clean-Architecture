import 'package:get_it/get_it.dart';
import 'package:movie_app_clean_architecture/movies/data/datasource/base_movie_remote_data_source.dart';
import 'package:movie_app_clean_architecture/movies/data/datasource/remote_movie_data_source.dart';
import 'package:movie_app_clean_architecture/movies/data/repository/movies_repository.dart';
import 'package:movie_app_clean_architecture/movies/domain/repository/base_movie_repository.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_movie_detials_usecase.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_now_playing_movie_use_case.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_popular_movie_use_case.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_top_rated_movie_use_case.dart';
import 'package:movie_app_clean_architecture/movies/presentation/controllers/bloc/movie_details_bloc.dart';
import 'package:movie_app_clean_architecture/movies/presentation/controllers/movies_bloc.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    /// Bloc
    getIt.registerFactory(() => MoviesBloc(getIt(), getIt(), getIt()));
    getIt.registerFactory(() => MovieDetailsBloc(getIt()));

    /// Use Cases
    getIt.registerLazySingleton(() => GetNowPlayingMovieUseCase(
          baseMovieRepository: getIt(),
        ));
    getIt.registerLazySingleton(() => GetPopularMovieUseCase(
          baseMovieRepository: getIt(),
        ));
    getIt.registerLazySingleton(() => GetTopRatedMovieUseCase(
          baseMovieRepository: getIt(),
        ));
    getIt.registerLazySingleton(() => GetMovieDetialsUsecase(
          baseMovieRepository: getIt(),
        ));

    /// Repository
    getIt.registerLazySingleton<BaseMovieRepository>(() => MoviesRepository(
          baseMovieRemoteDataSource: getIt(),
        ));

    /// Data Source
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => RemoteMovieDataSource());
  }
}
