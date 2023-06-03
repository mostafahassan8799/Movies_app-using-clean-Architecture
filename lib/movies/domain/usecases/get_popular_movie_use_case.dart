// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/core/usecase/base_usecase.dart';
import 'package:movie_app_clean_architecture/movies/domain/entities/movie.dart';
import 'package:movie_app_clean_architecture/movies/domain/repository/base_movie_repository.dart';

import '../../../core/error/failure.dart';

class GetPopularMovieUseCase extends BaseUseCase<List<Movie>> {
  final BaseMovieRepository baseMovieRepository;
  GetPopularMovieUseCase({
    required this.baseMovieRepository,
  });
  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMovieRepository.getPopularMovies();
  }
}
