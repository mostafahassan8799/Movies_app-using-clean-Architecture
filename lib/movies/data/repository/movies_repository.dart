// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/core/error/exception.dart';
import 'package:movie_app_clean_architecture/core/error/failure.dart';
import 'package:movie_app_clean_architecture/movies/data/datasource/base_movie_remote_data_source.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/movie.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/movie_details.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/recommendation.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_movie_detials_usecase.dart';
import 'package:movie_app_clean_architecture/movies/domain/usecases/get_recommendation_usecase.dart';
import '../../domain/repository/base_movie_repository.dart';

class MoviesRepository extends BaseMovieRepository {
  BaseMovieRemoteDataSource baseMovieRemoteDataSource;
  MoviesRepository({
    required this.baseMovieRemoteDataSource,
  });
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovie();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovie();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getTopRatedMovie();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailParameters parameters) async {
    final result = await baseMovieRemoteDataSource.getMovieDetials(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Recommendation>>> getRecommendation(
      RecommendationParameters parameters) async {
    final result =
        await baseMovieRemoteDataSource.getRecommendation(parameters);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(message: failure.errorMessageModel.statusMessage));
    }
  }
}
