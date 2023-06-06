// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:movie_app_clean_architecture/core/error/failure.dart';
import 'package:movie_app_clean_architecture/core/usecase/base_usecase.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/movie_details.dart';
import 'package:movie_app_clean_architecture/movies/domain/repository/base_movie_repository.dart';

class GetMovieDetialsUsecase
    extends BaseUseCase<MovieDetail, MovieDetailParameters> {
  BaseMovieRepository baseMovieRepository;
  GetMovieDetialsUsecase({
    required this.baseMovieRepository,
  });
  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailParameters parameters) async {
    return await baseMovieRepository.getMovieDetails(parameters);
  }
}

class MovieDetailParameters extends Equatable {
  final int movieId;

  const MovieDetailParameters({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
