import 'package:dartz/dartz.dart';
import 'package:movie_app_clean_architecture/core/usecase/base_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/movie.dart';
import '../repository/base_movie_repository.dart';

class GetTopRatedMovieUseCase extends BaseUseCase<List<Movie>> {
  final BaseMovieRepository baseMovieRepository;
  GetTopRatedMovieUseCase({
    required this.baseMovieRepository,
  });
  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMovieRepository.getTopRatedMovies();
  }
}
